#include <iostream>
#include <unistd.h>
#include "screen/Screen.h"
#include "system/System.h"

int main()
{
    unsigned int width  = 800;
    unsigned int height = 600;

    bool skipRst    = false;
    bool fastStep   = true;
    bool showScreen = false;
    bool trapped    = false;

    System system;
    Screen screen( width, height );

    z80_t*    cpu = system.setup();
    rm380z_t* sys = system.rm380z;

    cpu->trace = false;

    screen.init();

    sf::RenderWindow* window = screen.getWindow();

    screen.clearScreen();

    while ( window->isOpen() )
    {
        sf::Event event;

        uint16_t pc = z80_pc(cpu);

        if ( pc <= 0xCB )
        {
            if ( ! fastStep )
            {
                std::cout << "SKIPPING RST 38H" << std::endl;

                skipRst  = true;
                fastStep = true;
            }
        }
        else if ( skipRst )
        {
            skipRst  = false;
            fastStep = false;
        }

        while ( window->pollEvent( event ) )
        {
            if ( event.type == sf::Event::Closed )
            {
                window->close();
            }
            else if ( event.type == sf::Event::KeyPressed )
            {
                int keyCode = event.key.code;

                system.keyDown( keyCode );
            }

            if ( sf::Keyboard::isKeyPressed(sf::Keyboard::Left ) )
            {
                system.step();

                cpu->trace = true;

                fastStep = false;
                trapped  = false;

                if ( sys->screenUpdated )
                {
                    showScreen = true;
                    sys->screenUpdated = false;
                }
            }
            else if ( sf::Keyboard::isKeyPressed(sf::Keyboard::Right ) )
            {
                fastStep = true;
            }
            else if ( sf::Keyboard::isKeyPressed(sf::Keyboard::Up ) )
            {
                cpu->trace = true;
            }
            else if ( sf::Keyboard::isKeyPressed(sf::Keyboard::Down ) )
            {
                fastStep = true;

                cpu->trace = false;
            }
        }

        if ( fastStep )
        {
            if ( system.step() )
            {
                trapped = true;
                fastStep = false;

                std::cout << "Trap Address Reached" << std::endl;
            }

            if ( sys->screenUpdated )
            {
                showScreen = true;
                sys->screenUpdated = false;
                sys->keyPressed = 0x0;
            }
        }

        if ( showScreen )
        {
            screen.drawScreen();

            showScreen = false;
        }
    }

    return 0;
}