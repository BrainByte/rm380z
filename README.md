# rm380z

rm380z emulator

# cos 4.0 

The "cos40b-m.bin" ROM is mapped initially at 0x0000.

In the early stages, the code writes at 

0x4010 C3
0x4011 38
0x4012 E4

jmp 0xE438

So, when the code executes:

0x000B LD A,0xA3
0x000D LD (LBFC),A

it bank-switches (by writing on port0) 

- ROM from 0x0000 to 0xE000
- RAM from 0x4000 to 0x0000. 

So, the next instructions are the ones it wrote before at 0x4010. So the code jumps to 0xE438

I can continue debugging now smile