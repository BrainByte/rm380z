#perl process-source.pl BB-380Z-Monitor-v2.3.txt > bb-monitor.asm
#grep -E '^[0-9A-F]{4}   [0-9A-F]' BB-380Z-Monitor-v2.3.txt | grep -v 'DEFM' | cut -c1-13 | cut -d\  -f1-4 > bb-original-binary.lst
z80asm bb-tiny-basic.asm -lbb-tiny-basic.lst -obb-tiny-basic.bin
#perl process-listing.pl bb-tiny-basic.lst > bb-gen-binary.lst
cp bb-tiny-basic.bin ../..
