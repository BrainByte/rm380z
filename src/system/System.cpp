#define CHIPS_IMPL
#include "System.h"

/*-- IMPLEMENTATION ----------------------------------------------------------*/
#ifdef CHIPS_IMPL

#ifndef CHIPS_ASSERT
#include <assert.h>
#define CHIPS_ASSERT(c) assert(c)
#endif

#define _RM380Z_DISPLAY_WIDTH (256)
#define _RM380Z_DISPLAY_HEIGHT (256)
#define _RM380Z_DISPLAY_SIZE (_RM380Z_DISPLAY_WIDTH*_RM380Z_DISPLAY_HEIGHT*4)
#define _RM380Z_CLEAR( val ) memset(&val, 0, sizeof(val))

z80_t* System::setup()
{
    systemTimer  = new Timer;

    systemTimer->ticks = 0;
    systemTimer->setIntervalCf( std::bind( &System::timerTick, this, std::placeholders::_1 ), 5 );
    //systemTimer->setTimeoutCf( std::bind( &System::timerStop, this ), 20200 );
    //systemTimer->setIntervalCb( timerTick, 1000 );
    //systemTimer->setTimeoutCb( timerStop, 20200 );

    //memory = new Memory;

    //memory->readRom();

    size_t bytesRead = smem::readRom();

    int romFontSize     = 1024 * 2;
    int romOsSize       = bytesRead;
    int pixelBufferSize = dislayWidthPixels * displayHeightPixels * 4; // RGBA

    pixelBuffer = new uint32_t[ pixelBufferSize ];

    auto *romFont = new uint8_t[romFontSize];
    auto *romOs   = smem::mem;

    rm380z     = new rm380z_t;
    rm380zDesc = new rm380z_desc_t;

    rm380z->pixel_buffer = pixelBuffer;

    rm380zDesc->pixel_buffer      = pixelBuffer;
    rm380zDesc->pixel_buffer_size = pixelBufferSize;
    rm380zDesc->rom_font          = romFont;
    rm380zDesc->rom_font_size     = romFontSize;
    rm380zDesc->rom_cos           = romOs;
    rm380zDesc->rom_cos_size      = romOsSize;

    return init( rm380z, rm380zDesc );
}

z80_t* System::init( rm380z_t *sys, const rm380z_desc_t *desc )
{
    CHIPS_ASSERT( sys && desc );
    CHIPS_ASSERT( desc->pixel_buffer && (desc->pixel_buffer_size >= _RM380Z_DISPLAY_SIZE));
    CHIPS_ASSERT( desc->rom_font && (desc->rom_font_size == sizeof( sys->rom_font )));
    //CHIPS_ASSERT( desc->rom_cos && (desc->rom_cos_size == sizeof( sys->rom_os )));

    memset( sys, 0, sizeof( rm380z_t ));

    sys->valid = true;
    sys->type = desc->type;
    sys->pixel_buffer = ( uint32_t * ) desc->pixel_buffer;

    memcpy( sys->rom_font, desc->rom_font, sizeof( sys->rom_font ));
    //memcpy( sys->rom_os, desc->rom_cos, sizeof( sys->rom_os ));

    /* initialize the hardware */
    z80_desc_t cpu_desc;

    _RM380Z_CLEAR( cpu_desc );

    cpu_desc.tick_cb   = tick;
    cpu_desc.user_data = sys;

    z80_init( &sys->cpu, &cpu_desc );

    z80pio_desc_t pio_desc;

    _RM380Z_CLEAR( pio_desc );

    pio_desc.in_cb     = pioIn;
    pio_desc.out_cb    = pioOut;
    pio_desc.user_data = sys;

    z80pio_init( &sys->pio, &pio_desc );

    clk_init( &sys->clk, 1000000 );

    smem::writeAddress( 0x1000, 0xFF ); // FIXME STOP NEXTROM
    /* execution starts at 0x0000 */
    z80_set_pc( &sys->cpu, romStart );

    /*
    mem_init( &sys->mem );

    mem_map_ram( &sys->mem, 0, 0x4000, 0x8000, sys->ram );
    mem_map_rom( &sys->mem, 0, romStart, 0x1000, sys->rom_os );
    */

    /* Setup the keyboard matrix, the original RM380Z.01 has a 8x4 matrix with
       4 shift keys, later models also support a more traditional 8x8 matrix.
    */
    /* keep key presses sticky for 2 frames */
    kbd_init( &sys->kbd, 2 );

    if ( RM380Z_TYPE_01 == sys->type )
    {
        /* 8x4 keyboard matrix */
        kbd_register_modifier( &sys->kbd, 0, 0, 3 );
        kbd_register_modifier( &sys->kbd, 1, 1, 3 );
        kbd_register_modifier( &sys->kbd, 2, 2, 3 );
        kbd_register_modifier( &sys->kbd, 3, 3, 3 );

        const char *keymap =
                /* no shift */
                "@ABCDEFG"  "HIJKLMNO"  "PQRSTUVW"  "        "
                /* shift 1 */
                "XYZ[\\]^-" "01234567"  "89:;<=>?"  "        "
                /* shift 2 */
                "   {|}~ "  " !\"#$%&'" "()*+,-./"  "        "
                /* shift 3 */
                " abcdefg"  "hijklmno"  "pqrstuvw"  "        "
                /* shift 4 */
                "xyz     "  "        "  "        "  "        ";

        for ( int layer = 0; layer < 5; layer++ )
        {
            for ( int line = 0; line < 4; line++ )
            {
                for ( int column = 0; column < 8; column++ )
                {
                    int c = keymap[layer * 32 + line * 8 + column];

                    if ( c != 0x20 )
                    {
                        kbd_register_key( &sys->kbd, c, column, line, layer ? (1 << (layer - 1)) : 0 );
                    }
                }
            }
        }

        /* special keys */
        kbd_register_key( &sys->kbd, ' ', 5, 3, 0 );   /* Space */
        kbd_register_key( &sys->kbd, 0x08, 4, 3, 0 );  /* Cursor Left */
        kbd_register_key( &sys->kbd, 0x09, 6, 3, 0 );  /* Cursor Right */
        kbd_register_key( &sys->kbd, 0x0D, 7, 3, 0 );  /* Enter */
        kbd_register_key( &sys->kbd, 0x03, 3, 1, 4 );  /* Break/Escape */
    }
    else
    {
        /* 8x8 keyboard matrix (http://www.rm380z.de/images/21.gif) */
        /* shift key modifier is column 7 line 6 */
        const int shift = 0, shift_mask = (1 << shift);

        kbd_register_modifier( &sys->kbd, shift, 7, 6 );
        /* ctrl key modifier is column 6 line 5 */
        const int ctrl = 1, ctrl_mask = (1 << ctrl);

        kbd_register_modifier( &sys->kbd, ctrl, 6, 5 );

        const char *keymap =
                /* no shift */
                "13579-  QETUO@  ADGJL*  YCBM.^  24680[  WRZIP]  SFHK+\\  XVN,/_  "
                /* shift */
                "!#%')=  qetuo`  adgjl:  ycbm>~  \"$&( {  wrzip}  sfhk;|  xvn<?   ";

        for ( int layer = 0; layer < 2; layer++ )
        {
            for ( int line = 0; line < 8; line++ )
            {
                for ( int column = 0; column < 8; column++ )
                {
                    int c = keymap[layer * 64 + line * 8 + column];

                    if ( c != 0x20 )
                    {
                        kbd_register_key( &sys->kbd, c, column, line, layer ? shift_mask : 0 );
                    }
                }
            }
        }
        /* special keys */
        kbd_register_key( &sys->kbd, ' ', 6, 4, 0 );  /* space */
        kbd_register_key( &sys->kbd, 0x08, 6, 2, 0 );  /* cursor left */
        kbd_register_key( &sys->kbd, 0x09, 6, 3, 0 );  /* cursor right */
        kbd_register_key( &sys->kbd, 0x0A, 6, 7, 0 );  /* cursor down */
        kbd_register_key( &sys->kbd, 0x0B, 6, 6, 0 );  /* cursor up */
        kbd_register_key( &sys->kbd, 0x0D, 6, 1, 0 );  /* enter */
        kbd_register_key( &sys->kbd, 0x03, 1, 3, ctrl_mask ); /* map Esc to Ctrl+C (STOP/BREAK) */
    }

    sys->keyPressed = 0x0;
    
    //smem::writeAddress( KEYBD, 0x00 );

    return &sys->cpu;
}

void System::discard( rm380z_t *sys )
{
    CHIPS_ASSERT( sys && sys->valid );

    sys->valid = false;
}

int System::getDisplayWidth()
{
    return _RM380Z_DISPLAY_WIDTH;
}

int System::getDisplayHeight()
{
    return _RM380Z_DISPLAY_HEIGHT;
}

int System::getMaxDisplaySize()
{
    return _RM380Z_DISPLAY_SIZE;
}

int System::setDisplayWidth( rm380z_t *sys )
{
    ( void ) sys;
    return _RM380Z_DISPLAY_WIDTH;
}

int System::setDisplayHeight( rm380z_t *sys )
{
    ( void ) sys;
    return _RM380Z_DISPLAY_HEIGHT;
}

void System::reset( rm380z_t *sys )
{
    CHIPS_ASSERT( sys && sys->valid );

    z80_reset( &sys->cpu );

    z80pio_reset( &sys->pio );

    sys->kbd_request_column = 0;

    z80_set_pc( &sys->cpu, 0xF000 );
}

void System::exec( uint32_t micro_seconds )
{
    rm380z_t* sys = rm380z;

    CHIPS_ASSERT( sys && sys->valid );

    uint32_t ticks_to_run = clk_ticks_to_run( &sys->clk, micro_seconds );
    uint32_t ticks_executed = z80_exec( &sys->cpu, ticks_to_run );

    clk_ticks_executed( &sys->clk, ticks_executed );

    kbd_update( &sys->kbd, micro_seconds );

    decodeVidMem( sys );

    systemTimer->ticks += ticks_executed;
}

bool System::step()
{
    trapOn = false;

    rm380z_t* sys = rm380z;

    CHIPS_ASSERT( sys && sys->valid );

    do
    {
        uint32_t ticks_executed = z80_exec( &sys->cpu, 1 );

        clk_ticks_executed( &sys->clk, ticks_executed );

        systemTimer->ticks += ticks_executed;
    }
    while ( ! z80_opdone( &sys->cpu ) );

    uint16_t pc = z80_pc( &sys->cpu );

    bool trapAddressReached = pc == trapAddress && trapAddress > 0x0;

    if ( trapAddressReached )
    {
        trapOn = true;

        ( &sys->cpu )->trace = true;
    }

    return trapOn;

    //std::cout << std::endl << "STEPPED" << std::endl;

    //kbd_update( &sys->kbd, micro_seconds );

    //decodeVidMem( sys );
}

void System::keyDown( int key_code )
{
    //CHIPS_ASSERT( sys && sys->valid );
    //kbd_key_down( &sys->kbd, key_code );

    rm380z_t* sys = rm380z;

    int8_t asciiKey = 0;

    if ( prevKeyCode > 0 )
    {
        if ( prevKeyCode == 38 )
        {
            switch ( key_code )
            {
                case 55 :
                    asciiKey = 43;
                    break;

                default :
                    asciiKey = key_code + 6;
            }
        }
        else
        {
            switch ( key_code )
            {
                default :
                    asciiKey = key_code + 1;
            }
        }

        prevKeyCode = 0;
    }
    else if ( key_code > 25 && key_code < 35 ) // Numbers
    {
        asciiKey = key_code + 22;
    }
    else if ( key_code == 38 )
    {
        prevKeyCode = key_code;

        std::cout << "Shift" << std::endl;
    }
    else
    {
        switch ( key_code )
        {
            case 55 :
                asciiKey = 61;
                break;
            case 56 :
                asciiKey = 45;
                break;
            case 57 :
                asciiKey = 32;
                break;
            case 58 :
                asciiKey = 13;
                break;
            case 59 :
                asciiKey = 127;
                break;
            case 37 :
                prevKeyCode = key_code;
                asciiKey = -1;
                break;

            default :
                asciiKey = key_code + 65;
        }
    }

    if ( asciiKey > 0 )
    {
        //std::cout << "Key Written : " << std::hex << asciiKey << std::endl;

        int8_t keyb  = smem::readAddress( KEYBD );
        char*  keybx = new char[32];

        toHex( keybx, keyb );

        std::cout << "Key Updated : " << keybx << " : " << asciiKey << std::endl;

        delete [] keybx;

        prevKeyCode = 0;

        sys->keyPressed = asciiKey;
    }
    else
    {
        //std::cout << "Key Ignored : " << key_code << std::endl;

        //sys->keyPressed = 0;
    }
}

void System::keyUp( rm380z_t *sys, int key_code )
{
    CHIPS_ASSERT( sys && sys->valid );
    kbd_key_up( &sys->kbd, key_code );
}

uint64_t System::tick( int num_ticks, uint64_t pins, void *user_data )
{
    ( void ) num_ticks;

    rm380z_t *sys = ( rm380z_t * ) user_data;

    if ( pins & Z80_MREQ )
    {
        /* a memory request */
        const uint16_t addr = Z80_GET_ADDR( pins );

        if ( pins & Z80_RD)
        {
            /* read memory byte */
            //Z80_SET_DATA( pins, mem_rd( &sys->mem, addr ) );

            uint8_t data = smem::readAddress( addr );

            if ( addr == PORT0 )
            {
                if ( sys->keyPressed == 0 )
                {
                    data = 0x0;
                }
                else
                {
                    data = sys->keyPressed;

                    std::cout << "PORT0 : KeyPressed" << std::endl;
                }
            }

            Z80_SET_DATA( pins, data );

            //sys->keyPressed = 0x0;
        }
        else if ( pins & Z80_WR)
        {
            //mem_wr( &sys->mem, addr, Z80_GET_DATA( pins ));
            smem::writeAddress( addr, Z80_GET_DATA( pins ) );

            if ( addr > 0x800 && addr < 0x0DE9 )
                sys->screenUpdated = true;
        }
    }
    else if ( pins & Z80_IORQ)
    {
        /* an I/O request */
        /*
            The PIO Chip-Enable pin (Z80PIO_CE) is connected to output pin 0 of
            a MH7442 BCD-to-Decimal decoder (looks like this is a Czech
            clone of a SN7442). The lower 3 input pins of the MH7442
            are connected to address bus pins A2..A4, and the 4th input
            pin is connected to IORQ. This means the PIO is enabled when
            the CPU IORQ pin is low (active), and address bus bits 2..4 are
            off. This puts the PIO at the lowest 4 addresses of an 32-entry
            address space (so the PIO should be visible at port number
            0..4, but also at 32..35, 64..67 and so on).

            The PIO Control/Data select pin (Z80PIO_CDSEL) is connected to
            address bus pin A0. This means even addresses select a PIO data
            operation, and odd addresses select a PIO control operation.

            The PIO port A/B select pin (Z80PIO_BASEL) is connected to address
            bus pin A1. This means the lower 2 port numbers address the PIO
            port A, and the upper 2 port numbers address the PIO port B.

            The keyboard matrix columns are connected to another MH7442
            BCD-to-Decimal converter, this converts a hardware latch at port
            address 8 which stores a keyboard matrix column number from the CPU
            to the column lines. The operating system scans the keyboard by
            writing the numbers 0..7 to this latch, which is then converted
            by the MH7442 to light up the keyboard matrix column lines
            in that order. Next the CPU reads back the keyboard matrix lines
            in 2 steps of 4 bits each from PIO port B.
        */
        if ((pins & (Z80_A4 | Z80_A3 | Z80_A2)) == 0 )
        {
            /* address bits A2..A4 are zero, this activates the PIO chip-select pin */
            uint64_t pio_pins = (pins & Z80_PIN_MASK) | Z80PIO_CE;

            /* address bit 0 selects data/ctrl */
            if ( pio_pins & (1 << 0)) pio_pins |= Z80PIO_CDSEL;

            /* address bit 1 selects port A/B */
            if ( pio_pins & (1 << 1)) pio_pins |= Z80PIO_BASEL;

            pins = z80pio_iorq( &sys->pio, pio_pins ) & Z80_PIN_MASK;
        }
        else if ((pins & (Z80_A3 | Z80_WR)) == (Z80_A3 | Z80_WR))
        {
            /* port 8 is connected to a hardware latch to store the
               requested keyboard column for the next keyboard scan
            */
            sys->kbd_request_column = Z80_GET_DATA( pins ) & 7;
        }
    }

    /* there are no interrupts happening in a vanilla RM380Z,
       so don't trigger the interrupt daisy chain
    */
    return pins;
}

/* the PIO input callback handles keyboard input */
uint8_t System::pioIn( int port_id, void *user_data )
{
    rm380z_t *sys = ( rm380z_t * ) user_data;

    std::cout << "PORT_IN : " << port_id;

    if ( Z80PIO_PORT_A == port_id )
    {
        /* nothing to return here, PIO port A is for user devices */
        return 0xFF;
    }
    else
    {
        /* port B is for cassette input (bit 7, not implemented),
            and the lower 4 bits are for are connected to the keyboard matrix lines
        */
        uint16_t column_mask = 1 << sys->kbd_request_column;
        uint16_t line_mask = kbd_test_lines( &sys->kbd, column_mask );

        if ( RM380Z_TYPE_01 != sys->type )
        {
            if ( sys->kbd_request_line_hilo )
            {
                line_mask >>= 4;
            }
        }

        return 0x0F & ~(line_mask & 0x0F);
    }
}

/* the PIO output callback selects the upper or lower 4 lines for the next keyboard scan */
void System::pioOut( int port_id, uint8_t data, void *user_data )
{
    rm380z_t *sys = ( rm380z_t * ) user_data;

    if ( Z80PIO_PORT_B == port_id )
    {
        /* bit 4 for 8x8 keyboard selects upper or lower 4 kbd matrix line bits */
        sys->kbd_request_line_hilo = (data & (1 << 4)) != 0;
        /* bit 7 is cassette output, not emulated */
    }
}

/* since the RM380Z didn't have any sort of programmable video output,
    we're cheating a bit and decode the entire frame in one go
*/
void System::decodeVidMem( rm380z_t *sys )
{
    uint32_t *dst = sys->pixel_buffer;

    const uint8_t *src = &sys->ram[0xEC00];   /* the 32x32 framebuffer starts at EC00 */
    const uint8_t *font = sys->rom_font;

    for ( int y = 0; y < 32; y++ )
    {
        for ( int py = 0; py < 8; py++ )
        {
            for ( int x = 0; x < 32; x++ )
            {
                uint8_t chr = src[(y << 5) + x];
                uint8_t bits = font[(chr << 3) | py];

                for ( int px = 7; px >= 0; px-- )
                {
                    *dst++ = bits & (1 << px) ? 0xFFFFFFFF : 0xFF000000;
                }
            }
        }
    }
}

void System::copyMemory( uint8_t* screenBuffer )
{
    // C : 0x43
    // O : 0x4F
    // S : 0x53

    // 0x0DC0H
    // 0xF000H  <- Start of screen
    int screenStart = 0xF000;
    int screenStop  = 0xF537;

    //memcpy( screenBuffer, rm380z->ram, sizeof( rm380z->ram ) );
    memcpy( screenBuffer, smem::mem + screenStart, sizeof( screenBuffer ) );

    int sizeRam = sizeof rm380z->ram;

    /*
    for ( int i=screenStart; i<screenStop; i++ )
    {
        if ( rm380z->ram[i] == 0x43 && rm380z->ram[i + 1] == 0x4F )
        {
            std::cout << "Screen : " << i << "\n";
        }
    }
    */
}

void System::timerTick( int tick )
{
    rm380z_t* sys = rm380z;

    uint32_t tocks = systemTimer->tocks;

    //cout << "\nTimer Tick ( " << tick << " ) - ( " << tocks << " ) ------------------------------------------------------------------------" << endl;

    // frame blanking bit (bit 6) of port1 becomes high
    // for about 4.5 milliseconds every 20 milliseconds

    if ( tocks == 4 )
    {
        //uint8_t port1b = mem_layer_rd( &sys->mem, 0, PORT1 ); // Before
        uint8_t port1b = smem::readAddress( PORT1 ); // Before

        char* port1bx = new char[32]; toHex( port1bx, port1b );

        //std::cout << std::endl << "Set FB Bit - Port 1 (B) : " << port1bx << std::endl;

        port1b |= 0x40;

        //mem_layer_wr( &sys->mem, 0, PORT1, port1b );
        smem::writeAddress( PORT1, port1b );

        //uint8_t port1a = mem_layer_rd( &sys->mem, 0, PORT1 ); // After
        uint8_t port1a = smem::readAddress( PORT1 ); // After

        char* port1ax = new char[32]; toHex( port1ax, port1a );

        //std::cout << std::endl << "Set FB Bit - Port 1 (A) : " << port1ax << std::endl;

        delete [] port1ax;
        delete [] port1bx;
    }

    if ( tocks == 5 )
    {
        //uint8_t port1b = mem_rd( &sys->mem, PORT1 ); // Before
        uint8_t port1b = smem::readAddress( PORT1 ); // Before

        port1b &= 0xBF;

        //mem_layer_wr( &sys->mem, 0, PORT1, port1b );
        smem::writeAddress( PORT1, port1b );

        //std::cout << std::endl << "Reset FB Bit - Tocks " << tocks << std::endl;

        systemTimer->tocks = 0;
    }

    // Reset          = state->m_port1=0x00;
    // Frame Blanking = state->m_port1=0x41;
    // Line Blanking  = state->m_port1|=0x80;
}

void System::timerStop()
{
    // FIX
    //systemTimer->stop();

    std::cout << "Timer End " << std::endl;
}

/*=== FILE LOADING ===========================================================*/

typedef struct
{
    uint8_t load_addr_l;
    uint8_t load_addr_h;
    uint8_t end_addr_l;
    uint8_t end_addr_h;
    uint8_t exec_addr_l;
    uint8_t exec_addr_h;
    uint8_t free[6];
    uint8_t typ;
    uint8_t d3[3];        /* d3 d3 d3 */
    uint8_t name[16];
} _rm380z_kcz80_header;

bool System::quickLoad( rm380z_t *sys, const uint8_t *ptr, int num_bytes )
{
    CHIPS_ASSERT( sys && sys->valid && ptr );
    if ( num_bytes < ( int ) sizeof( _rm380z_kcz80_header ))
    {
        return false;
    }
    const _rm380z_kcz80_header *hdr = ( const _rm380z_kcz80_header * ) ptr;

    if ((hdr->d3[0] != 0xD3) || (hdr->d3[1] != 0xD3) || (hdr->d3[2] != 0xD3))
    {
        return false;
    }

    ptr += sizeof( _rm380z_kcz80_header );
    uint16_t exec_addr = 0;
    int addr = (hdr->load_addr_h << 8 | hdr->load_addr_l) & 0xFFFF;
    int end_addr = (hdr->end_addr_h << 8 | hdr->end_addr_l) & 0xFFFF;

    if ( end_addr <= addr )
    {
        return false;
    }

    exec_addr = (hdr->exec_addr_h << 8 | hdr->exec_addr_l) & 0xFFFF;

    mem_write_range( &sys->mem, addr, ptr, end_addr - addr );

    z80_reset( &sys->cpu );
    z80_set_a( &sys->cpu, 0x00 );
    z80_set_f( &sys->cpu, 0x10 );
    z80_set_bc( &sys->cpu, 0x0000 );
    z80_set_bc_( &sys->cpu, 0x0000 );
    z80_set_de( &sys->cpu, 0x0000 );
    z80_set_de_( &sys->cpu, 0x0000 );
    z80_set_hl( &sys->cpu, 0x0000 );
    z80_set_hl_( &sys->cpu, 0x0000 );
    z80_set_af_( &sys->cpu, 0x0000 );
    z80_set_pc( &sys->cpu, exec_addr );

    return true;
}

void System::toHex( char* hexBuffer, uint16_t number )
{
    snprintf( hexBuffer, sizeof( hexBuffer ), "%0.4X", number );
}

#endif /* CHIPS_IMPL */

