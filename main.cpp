#include <iostream>
#include <SFML/Graphics.hpp>
#include <SFML/System/Vector2.hpp>
#include "Screen.h"
#include "Memory.h"

using namespace std;

int main()
{
    unsigned int width  = 800;
    unsigned int height = 600;

    Memory memory;
    Screen screen( width, height );

    memory.readRom();
    screen.init();

    sf::RenderWindow* window = screen.getWindow();

    screen.clearScreen();

    while ( window->isOpen() )
    {
        sf::Event event;

        while ( window->pollEvent( event ))
        {
            if ( event.type == sf::Event::Closed )
                window->close();

            if (sf::Keyboard::isKeyPressed(sf::Keyboard::Left))
            {
                // left key is pressed: move our character
                screen.updateText( "Hello Jono LEFT" );
                screen.draw();
            }
        }

        screen.drawScreen( &memory );
    }

    return 0;
}