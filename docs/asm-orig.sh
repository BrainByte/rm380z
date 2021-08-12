perl process-source.pl RML-380Z-Monitor-v2.3.txt > monitor.asm
grep -E '^[0-9A-F]{4}   [0-9A-F]' RML-380Z-Monitor-v2.3.txt | grep -v 'DEFM' | cut -c1-13 | cut -d\  -f1-4 > original-binary.lst
z80asm monitor.asm -lgen.lst
perl process-listing.pl gen.lst > gen-binary.lst
