#pragma once

#include <fstream>
#include <cstring>
#include <iostream>

namespace smem
{
    extern char *fileData;
    extern uint8_t mem[(1 << 16)];

    char *readFileBytes( const char *name, size_t &bytesRead );

    size_t readRom();

    uint8_t readAddress( uint16_t address );

    void writeAddress( uint16_t address, uint8_t data );

    void toHex( char* hexBuffer, uint16_t number, const char* format );
}