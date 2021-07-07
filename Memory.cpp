//
// Created by jonoh on 06/07/2021.
//

#include "Memory.h"

// Public
void Memory::readRom()
{
    fileData = readFileBytes( "/data/c-code/rm380z/data.txt" );

    int fileSize = strlen( fileData );

    int memSize = 1 << 16;

    for ( int i = 0; i < memSize; i++ )
    {
        if ( i < 32768 )
            mem[i] = fileData[i];
        else
            mem[i] = 0x0;
    }
}

uint8_t Memory::readAddress( uint16_t address )
{
    uint8_t data = mem[ address ];

    return data;
}
// Private
char* Memory::readFileBytes( const char* name )
{
    std::ifstream fl( name );
    fl.seekg( 0, std::ios::end );
    size_t len = fl.tellg();
    char* ret = new char[65535];
    fl.seekg( 0, std::ios::beg );
    fl.read( ret, len );
    fl.close();
    return ret;
}