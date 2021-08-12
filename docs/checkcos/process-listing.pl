while (<>) {
    if (m/^([0-9a-f]{4}) ([0-9a-f]{2})\s+RST 30H/) { # EMT macro
        my $addr = $1;
        my $macr = $2;
        my $next = <>;
        $next =~ m/^[0-9a-f]{4} ([0-9a-f]{2})/;
        print uc("$addr   $macr$1\n");
    }
    elsif (m/^([0-9a-f]{4}) ([0-9a-f]{2})\s+RST 28H/) { # CALR macro
        my $addr = $1;
        my $macr = $2;
        my $next = <>;
        $next =~ m/^[0-9a-f]{4} ([0-9a-f]{2})/;
        print uc("$addr   $macr$1\n");
    }
    elsif (m/^([0-9a-f]{4}) ([0-9a-f]{2})\s?([0-9a-f]{2})?\s?([0-9a-f]{2})?/) {
        print uc("$1   $2$3$4\n");
    }
}

