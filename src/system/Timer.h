#pragma once

#include <iostream>
#include <thread>
#include <chrono>
#include <atomic>
#include <functional>

/*
class Timer
{
    std::atomic<bool> active{true};

public:
    void setTimeout( auto function, int delay );

    void setInterval( auto function, int interval );

    void stop ();
};
*/

class Timer
{
    std::atomic<bool> active{true};

public:
    typedef void (*TimerStartCb)( int num_ticks );
    typedef void (*TimerStopCb)();

    uint32_t tocks = 0;
    uint32_t ticks = 0;

    void setIntervalCf( std::function<void(int)> callback, int interval );

    void setTimeoutCf( std::function<void(int)> callback, int delay );

    void setIntervalCb( TimerStartCb callback, int interval );

    void setTimeoutCb( TimerStopCb callback, int delay );

    void stop();
};