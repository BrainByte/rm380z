#include "Screen.h"
#include "../memory/simple-mem.h"

Screen::Screen( unsigned int width, unsigned int height ) : width( width ), height( height )
{
    sf::Color    fontColor( 0.0f, 180.0f, 0.0f );
    sf::Vector2f size( width, height );

    charWidth  = width / MAX_WIDTH_CHARS;
    charHeight = height / MAX_HEIGHT_CHARS;

    box   = new sf::RectangleShape( size );
    shape = new sf::CircleShape( 100.f );

    screenBuffer = new unsigned char[MAX_HEIGHT_CHARS][MAX_WIDTH_CHARS];

    box->setFillColor( sf::Color::Black );

    font = new sf::Font;
    text = new sf::Text;

    if ( font->loadFromFile( "master0.ttf" ) )
    {
        text->setFont( *font );
        text->setString("Greetings Professor Falken !" );
        text->setCharacterSize( charHeight ); // in pixels, not points!
        text->setFillColor( fontColor );
        text->setScale( 2.0f, 1.0f );
        //text->setStyle(sf::Text::Bold | sf::Text::Underlined);
    }
    else
    {
        std::cout << "\nUnable to load character font";
    }

    shape->setFillColor( sf::Color::Green );
}

// Public
void Screen::init()
{
    this->window = new sf::RenderWindow( sf::VideoMode( width, height ), "RM380Z COS 2.3" );
}

sf::RenderWindow * Screen::getWindow()
{
    return window;
}

void Screen::setWindow( sf::RenderWindow* window )
{
    this->window = window;
}

void Screen::clearScreen()
{
    window->clear();
    window->draw( *box );
    window->display();
}

void Screen::draw()
{
    window->clear();
    window->draw( *box );
    window->draw( *text );
    window->display();
}

void Screen::drawScreen()
{
    window->clear();

    int numChars = MAX_WIDTH_CHARS * MAX_HEIGHT_CHARS;
    int row      = 0;
    int col      = 0;

    //uint16_t offset      = 0x800;
    uint16_t offset      = 0x800;
    uint16_t vtPointer   = 0;
    uint8_t  rowInc      = 0x18;
    char*    screenLine  = new char[41];
    bool     rowDirty    = false;
    bool     screenDirty = false;

    for ( int x = 0; x < numChars; x++ ) // 960 = 40 x 24
    {
        uint8_t data = smem::readAddress( offset + vtPointer );

        switch ( data )
        {
            case 0x5B: // LARR ( Left Arrow )
                data = '<';
                break;
            case 0x5D: // RARR ( Right Arrow )
                data = '>';
                break;
            case 0x5E: // UPARR ( Up Arrow )
                data = '^';
                break;
            case 0x7F: // CURSOR | DELETE
                data = '_';
                break;
            case 0x80: // BLANK
                data = ' ';
                break;
            default:
                break;
        }

        unsigned char prevChar = screenBuffer[row][col];
        screenBuffer[row][col] = data;

        if ( prevChar != data )
        {
            rowDirty    = true;
            screenDirty = true;
        }

        if ( ( x + 1 ) % MAX_WIDTH_CHARS == 0 )
        {
            screenBuffer[row][MAX_WIDTH_CHARS-1] = '\0';

            col = 0;

            for ( int c = 0; c < 40; c++ )
            {
                screenLine[ c ] = screenBuffer[row][ c ];
            }

            screenLine[40] = '\0';

            if ( screenLine[0] != '\0' )
            {
                if ( screenLine[0] == '0' ) // JONO STRANGE CHAR AT 0
                    screenLine[0] = ' ';

                text->setString( screenLine );
                text->setPosition( border, row * charHeight );

                if ( rowDirty )
                {
                    window->draw( *text );
                }
            }

            rowDirty = false;

            row++;
            vtPointer += rowInc;
        }

        if ( row > MAX_HEIGHT_CHARS )
            break;

        col++;
        vtPointer++;
    }

    delete [] screenLine;

    if ( screenDirty )
    {
        window->display();
    }
}

void Screen::writeText( const sf::String &string, int x, int y )
{
    text->setString( string );
    text->setPosition( x * charWidth, y * charHeight );
}

// Private
void Screen::initScreenBuffer()
{

}


