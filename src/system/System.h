#pragma once

#include <stdint.h>
#include <stdbool.h>
#include <iostream>
#include <functional>
#include <SFML/System/utf.hpp>
#include "Timer.h"
#include "../memory/simple-mem.h"
//#include "../memory/Memory.h"
#include "../cpu/clk.h"
#include "../cpu/kbd.h"
#include "../cpu/mem.h"
#include "../cpu/z80.h"
#include "../cpu/z80pio.h"
#include "../cpu/z80ctc.h"

/* rm380z model types */
typedef enum
{
    RM380Z_TYPE_01,      /* rm380z.64 (default, latest model with 2 MHz and 64 KB RAM, new ROM) */
    RM380Z_TYPE_02,      /* rm380z.16 (2 MHz model with 16 KB RAM, new ROM) */
    RM380Z_TYPE_03,      /* rm380z.01 (original model, 1 MHz, 16 KB RAM) */
} rm380z_type_t;

/* configuration parameters for rm380z_setup() */
typedef struct
{
    rm380z_type_t type;          /* default is rm380z_TYPE_64 */

    /* video output config */
    void *pixel_buffer;         /* pointer to a linear RGBA8 pixel buffer, at least 256*256*4 bytes */
    int pixel_buffer_size;      /* size of the pixel buffer in bytes */

    /* ROM images */
    const void *rom_cos;
    const void *rom_font;
    int rom_cos_size;
    int rom_font_size;
} rm380z_desc_t;

/* rm380z emulator state */
typedef struct
{
    z80_t cpu;
    z80pio_t pio;
    bool valid;
    rm380z_type_t type;
    uint8_t kbd_request_column;
    bool kbd_request_line_hilo;
    uint32_t *pixel_buffer;
    clk_t clk;
    mem_t mem;
    kbd_t kbd;
    uint8_t ram[1 << 16];
    uint8_t* rom_os;
    uint8_t rom_font[2048];
    uint8_t keyPressed;
    bool screenUpdated;
} rm380z_t;

class System
{
private:

    //Memory*        memory;
    bool           trapOn              = false;
    uint8_t        prevKeyCode         = 0;
    uint16_t       trapAddress         = 0; //0x208f;
    Timer*         systemTimer;
    int            tickCount           = 0;
    int            dislayWidthPixels   = 80 * 8;
    int            displayHeightPixels = 35 * 10;
    uint32_t*      pixelBuffer;
    rm380z_desc_t* rm380zDesc;

    const static uint16_t romStart = 0x0000;
    const static uint16_t KEYBD    = 0xFFC;
    const static uint16_t PORT0    = 0xFFC;
    const static uint16_t PORT1    = 0xFFE;

    void toHex( char* hexBuffer, uint16_t number );

public:
    static uint64_t tick( int num, uint64_t pins, void *user_data );
    static uint8_t pioIn( int port_id, void *user_data );
    static void pioOut( int port_id, uint8_t data, void *user_data );
    static void decodeVidMem( rm380z_t *sys );
    static z80_t* init( rm380z_t *sys, const rm380z_desc_t *desc );

    rm380z_t *rm380z;
    z80_t* setup();
    void discard( rm380z_t* sys );
    void reset( rm380z_t* sys );
    void exec( uint32_t micro_seconds );
    bool step();
    void keyDown( int key_code );
    void keyUp( rm380z_t* sys, int key_code );
    bool quickLoad( rm380z_t* sys, const uint8_t *ptr, int num_bytes );

    int getDisplayWidth();
    int getDisplayHeight();
    int getMaxDisplaySize();
    int setDisplayWidth( rm380z_t* sys );
    int setDisplayHeight( rm380z_t* sys );

    // SHort Term
    void copyMemory( uint8_t* screenBuffer );
    void timerTick( int tick );
    void timerStop();
};
