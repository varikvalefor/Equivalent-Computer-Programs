# concatenateNumbers(j) is the concatenation of all numbers between 1
# and j.
sub concatenateNumbers
{
	# $maximumNumber is the maximum number which should be added to the
	# concatenated thing.
	my $maximumNumber = shift;
	# $concatenatedNumbers is the current string of concatenated numbers.
	my $concatenatedNumbers = "";
	# $currentNum is the number which is currently being added to the
	# string of concatenated numbers.
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
