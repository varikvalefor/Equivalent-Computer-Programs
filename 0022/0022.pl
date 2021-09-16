#!/usr/bin/perl

use Time::HiRes;

# Buffering is disabled, ensuring that characters are "immediately"
# written to the standard output.
$|=1;

# This loop is run forever... unless something goes horribly, horribly
# wrong.
while(true)
{
	# For all characters in the message which should be written...
	foreach $i (split //, "We are the music makers.\n")
	{
		# A character is written to the standard output.
		print($i);
		# The program sleeps for 0.1 seconds.
		Time::HiRes::usleep(100000);
	}
}
