sub concatenateNumbers
{
	my $maximumNumber = shift;
	my $concatenatedNumbers = "";
	my $currentNum = 0;

	# For all $currentNum between 1 and $maximumNumber...
	for(my $currentNum = 1; $currentNum <= $maximumNumber; $currentNum++)
	{
		# $currentNum is appended to $concatenatedNumbers.
		$concatenatedNumbers = "$concatenatedNumbers$currentNum";
	}

	return $concatenatedNumbers;
}

print concatenateNumbers(@ARGV[0]), "\n";
