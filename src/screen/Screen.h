#ifndef RM380Z_SCREEN_H
#define RM380Z_SCREEN_H


#include <iostream>
#include <SFML/Graphics.hpp>
#include <SFML/System/Vector2.hpp>
#include "../memory/Memory.h"

class Screen
{
private:
    static const unsigned int MAX_WIDTH_CHARS  = 40;
    static const unsigned int MAX_HEIGHT_CHARS = 24;

    unsigned int border     = 8;
    unsigned int width      = 800;
    unsigned int height     = 600;
    unsigned int charWidth  = width / MAX_WIDTH_CHARS;
    unsigned int charHeight = height / MAX_HEIGHT_CHARS;

    unsigned char (*screenBuffer)[MAX_WIDTH_CHARS];

    sf::RenderWindow* window;
    sf::RectangleShape* box;
    sf::CircleShape* shape;
    sf::Text* text;
    sf::Font* font;
    void initScreenBuffer();

public:
    Screen( unsigned int width, unsigned int height );
    sf::RenderWindow* getWindow();
    void init();
    void setWindow( sf::RenderWindow* window );
    void clearScreen();
    void draw();
    void drawScreen();
    void writeText( const sf::String &string, int x, int y );
};


#endif //RM380Z_SCREEN_H
