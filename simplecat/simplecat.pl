open(F, "<", @ARGV[0]) or die;
while(<F>)
{
	print($_);
}
