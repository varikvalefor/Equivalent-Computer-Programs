$maximumNumber = int @ARGV[0];
$concatenatedNumbers = "";
$currentNum = 1;

# For all $currentNum between 1 and $maximumNumber...
for ($currentNum = 1; $currentNum <= $maximumNumber; $currentNum++)
{
	# $currentNum is appended to $concatenatedNumbers.
	$concatenatedNumbers = "$concatenatedNumbers$currentNum";
}

print "$concatenatedNumbers\n";
