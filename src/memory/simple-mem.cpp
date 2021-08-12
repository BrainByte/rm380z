#include "simple-mem.h"

namespace smem
{
    const static uint16_t PORT0 = 0xFFC;
    const static uint16_t PORT1 = 0xFFE;

    char *fileData;
    char *basicData;
    uint8_t mem[(1 << 16)] = {};
    size_t romSize = 0;

    size_t readRom()
    {
        size_t bytesReadOs    = 0;
        size_t bytesReadBasic = 0;

        //fileData = readFileBytes( "/data/c-code/rm380z/cos23.bin", bytesRead );
        fileData  = readFileBytes( "/data/c-code/rm380z/bb-cos-rom-23.bin", bytesReadOs );
        basicData = readFileBytes( "/data/c-code/rm380z/bb-tiny-basic.bin", bytesReadBasic );
        //basicData = readFileBytes( "/data/c-code/rm380z/rom.bin", bytesReadBasic );

        int basicRom = 0x2000;
        //int basicRom = 0x8000;
        int memSize  = 1 << 16;

        for ( int i = 0; i < memSize; i++ )
        {
            if ( i < basicRom )
                mem[ i ] = fileData[ i ];
            else
                mem[ i ] = basicData[ i - basicRom ];
        }

        romSize = bytesReadOs;

        return bytesReadOs;
    }

    uint8_t readAddress( uint16_t address )
    {
        uint8_t data = mem[ address ];

        /*
        if ( address == 0xFFC )
        {
            char* datax = new char[32];

            toHex( datax, data, "%0.2X" );

            std::cout << "Keyboard Read : " << datax << std::endl;

            delete [] datax;
        }
        */

        return data;
    }

    void writeAddress( uint16_t address, uint8_t data )
    {
        if ( address > romSize || address == PORT0 || address == PORT1 )
        {
            mem[ address ] = data;

            /*
            if ( address == 0xFFC )
            {
                char *datax = new char[32];

                toHex( datax, data, "%0.2X" );

                std::cout << "PORT0 Write : " << datax << std::endl;

                delete [] datax;
            }
            */
        }
    }

    char *readFileBytes( const char *name, size_t &bytesRead )
    {
        std::ifstream fl( name );
        fl.seekg( 0, std::ios::end );
        size_t len = fl.tellg();
        char *ret = new char[65535];
        fl.seekg( 0, std::ios::beg );
        fl.read( ret, len );
        fl.close();
        bytesRead = len;
        return ret;
    }

    void toHex( char* hexBuffer, uint16_t number, const char* format )
    {
        snprintf( hexBuffer, sizeof( hexBuffer ), format, number );
    }
}