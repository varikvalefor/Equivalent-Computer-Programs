$a = 0;
$b = 1;
$c = 0;
print("$a\n$b");
while($a + $b != Infinity)
{
	$c = $a + $b;
	$a = $b;
	$b = $c;
	print($c, "\n");
}
exit;
