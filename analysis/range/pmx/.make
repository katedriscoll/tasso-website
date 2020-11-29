#!/usr/bin/perl

my $scordir = "../../../../tasso-scores";
my $prange = `which prange`;
chomp $prange;
if ($prange =~ /^\s*$/) {
	"Die: install Humdrum Extras to use prange.";
}

use strict;
my @files = glob("$scordir/*/kern/*.krn");

for my $file (@files) {
	my $basename = $file;
	$basename =~ s/.*\///;
	$basename =~ s/-.*//;
	my $command = "$prange --score $file";
	#print "$command\n";
	my $contents = `$command`;
	if ($contents =~ /^\s*$/) {
		print STDERR "Error processing $basename\n";
		next;
	}
	open (FILE, ">$basename.txt") or die "Cannot write $basename.txt";
	print FILE $contents;
	close FILE;
}





