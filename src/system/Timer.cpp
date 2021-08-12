#include "Timer.h"

void Timer::setIntervalCf( std::function<void(int)> callback, int interval )
{
    active = true;

    std::thread t ( [=]()
    {
        while ( active.load() )
        {
            std::this_thread::sleep_for ( std::chrono::milliseconds ( interval ));

            if ( !active.load() )
                return;

            tocks++;

            callback( ticks );
        }
    } );

    t.detach ();
}

void Timer::setTimeoutCf( std::function<void(int)> callback, int delay )
{
    active = true;

    std::thread t ( [=] ()
    {
        if ( !active.load () )
            return;

        std::this_thread::sleep_for ( std::chrono::milliseconds ( delay ));

        if ( !active.load() )
            return;

        tocks++;

        callback( ticks );
    } );

    t.detach ();
}

void Timer::setIntervalCb( TimerStartCb callback, int interval )
{
    active = true;

    std::thread t ( [=] ()
    {
        while ( active.load ())
        {
            std::this_thread::sleep_for ( std::chrono::milliseconds ( interval ));

            if ( !active.load ())
                return;

            callback( ticks );
        }
    } );

    t.detach ();
}

void Timer::setTimeoutCb( TimerStopCb callback, int delay )
{
    active = true;

    std::thread t ( [=] ()
    {
        if ( !active.load ()) return;

        std::this_thread::sleep_for ( std::chrono::milliseconds ( delay ));

        if ( !active.load ()) return;

        callback();
    } );
    t.detach ();
}

void Timer::stop()
{
    active = false;
}

/* C++ 20
void Timer::setTimeout ( auto function, int delay )
{
    active = true;
    std::thread t ( [=] ()
    {
        if ( !active.load ()) return;
        std::this_thread::sleep_for ( std::chrono::milliseconds ( delay ));
        if ( !active.load ()) return;
        function ();
    } );
    t.detach ();
}

void Timer::setInterval( auto function, int interval )
{
    active = true;

    std::thread t ( [=] ()
    {
        while ( active.load ())
        {
            std::this_thread::sleep_for ( std::chrono::milliseconds ( interval ));
            if ( !active.load ()) return;
            function();
        }
    } );
    t.detach ();
}

void Timer::stop()
{
    active = false;
}
*/