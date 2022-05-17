#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

my @quote = (2,3,13,17,18,19,20);

my $header = <>;
$header =~ s/\W*$//;
$header = join('","', split /,/, $header);
print "\"$header\"\n";
while (<>) {
    s/\W*$//;
    my @cols = split /,/, $_;
    if ($cols[19] =~ m/^"/) {
        $cols[19] .= "," . $cols[20];
        $cols[20] = $cols[21];
        pop @cols;
        $cols[19] =~ s/"//g;
    }
    for my $col (@quote) {
        $cols[$col] = "\"$cols[$col]\"";
    }
    print join(",", @cols),"\n";
}