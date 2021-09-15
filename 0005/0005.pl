$maximumNumber = int @ARGV[0];
$concatenatedNumbers = "";
$currentNum = 1;

for ($currentNum = 1; $currentNum <= $maximumNumber; $currentNum++)
{
	$concatenatedNumbers = "$concatenatedNumbers$currentNum";
}

print "$concatenatedNumbers\n";
