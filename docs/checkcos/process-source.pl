print "
; RML pseudo-instructions

EMT:    macro trap
        RST 30H
        DEFB trap
        endm

; '-1' instead of '-2' because we're generating displacement from second byte already
CALR:   macro label
        RST 28H
        DEFB label-\$-1
        endm
";

my $remove_blanks = 0;

while (my $line = <>) {
    chomp $line;
    # Remove original page headings from listing and up to two following blank lines
    next if $line =~ m/\A\f/;
    if ($line =~ m/Z80 ASS V01-02/) {
        $remove_blanks = 2;
        next;
    }
    next if $line eq '' && $remove_blanks-- > 0;
    $line = substr($line, 24);
    # Remove assembler directives
    next if $line =~ m/^\*/;
    # z80asm requires labels to end with colon, even for EQU
    if ($line =~ m/\A(\S+)(\s+)(EQU\s.*)\Z/) {
        $line = $1 . ':' . substr($2, 1) . $3;
    }
    # z80asm has a quirk that doesn't require single quotes to be escaped in single quote-delimited character literals
    if ($line =~ m/\A(.*)''''(.*)\Z/) {
        $line = $1 . q{''' } . $2;
    }
    print $line, "\n";
}

