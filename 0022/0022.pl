#!/usr/bin/perl

use Time::HiRes;

$|=1;

while(true)
{
	foreach $i (split //, "We are the music makers.\n")
	{
		print($i);
		Time::HiRes::usleep(100000);
	}
}
