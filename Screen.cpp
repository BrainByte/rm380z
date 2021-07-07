//
// Created by jonoh on 06/07/2021.
//

#include "Screen.h"

Screen::Screen( unsigned int width, unsigned int height ) : width( width ), height( height )
{
    sf::Color    fontColor( 0.0f, 180.0f, 0.0f );
    sf::Vector2f size( width, height );

    charWidth  = width / 80;
    charHeight = height / 24;

    box   = new sf::RectangleShape( size );
    shape = new sf::CircleShape( 100.f );

    box->setFillColor( sf::Color::Black );

    font = new sf::Font;
    text = new sf::Text;

    if ( font->loadFromFile( "master0.ttf" ) )
    {
        text->setFont( *font );
        text->setString("Greetings Professor Falken !" );
        text->setCharacterSize( charHeight ); // in pixels, not points!
        text->setFillColor( fontColor );
        //text->setStyle(sf::Text::Bold | sf::Text::Underlined);
    }
    else
    {
        cout << "\nUnable to load character font";
    }

    shape->setFillColor( sf::Color::Green );
}

// Public
void Screen::init()
{
    this->window = new sf::RenderWindow( sf::VideoMode( width, height ), "Program" );
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

void Screen::drawScreen( Memory* memory )
{
    for ( int n = 0; n < 35; n++ )
    {
        for ( int i = 0; i < 80; i++ )
        {
            screenBuffer[n][i] = '\0';
        }
    }

    int row = 0;
    int col = 1;

    for ( uint16_t x = 0; x < 2000; x++ ) // 2000 = 80 x 25
    {
        uint8_t data = memory->readAddress( x );

        screenBuffer[row][col] = data;

        //if ( col > 79 )
        if ( data == '0' )
        {
            screenBuffer[row][79] = '\0';
            col = -1;
            row++;
        }

        text->setString( screenBuffer[row][col] );
        text->setPosition( col * charWidth, row * charHeight );

        window->draw( *text );

        if ( row > 25 )
            break;

        col++;
    }

    window->display();
}

void Screen::updateText( const sf::String &string )
{
    text->setString( string );
}

// Private
void Screen::initScreenBuffer()
{

}


