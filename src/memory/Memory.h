#pragma once

#include <fstream>
#include <cstring>

class Memory
{
private:
    char* readFileBytes( const char* name );
    char* fileData;
public:
    uint8_t mem[(1 << 16)] = { };
    size_t bytesRead;
    void readRom();
    uint8_t readAddress( uint16_t address );
    void writeAddress( uint16_t address, uint8_t data );
};
