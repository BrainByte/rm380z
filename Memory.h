//
// Created by jonoh on 06/07/2021.
//

#ifndef RM380Z_MEMORY_H
#define RM380Z_MEMORY_H

#include <fstream>
#include <cstring>

using namespace std;

class Memory
{
private:
    char* readFileBytes( const char* name );
    char* fileData;
    uint8_t mem[(1 << 16)] = { };
public:
    void readRom();
    uint8_t readAddress( uint16_t address );
};


#endif //RM380Z_MEMORY_H
