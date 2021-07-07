//
// Created by jonoh on 06/07/2021.
//

#ifndef RM380Z_SCREEN_H
#define RM380Z_SCREEN_H


#include <iostream>
#include <SFML/Graphics.hpp>
#include <SFML/System/Vector2.hpp>
#include "Memory.h"

using namespace std;

class Screen
{
private:
    unsigned int      width      = 800;
    unsigned int      height     = 600;
    unsigned int      charWidth  = 0;
    unsigned int      charHeight = 0;
    char screenBuffer[35][80];
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
    void drawScreen( Memory* memory );
    void updateText( const sf::String& string );
};


#endif //RM380Z_SCREEN_H
