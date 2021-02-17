for($a = 1; $a != Infinity; $a++)
{
	if($a % 15 == 0)   {print("FIZZ BUZZ\n");}
	elsif($a % 5 == 0) {print("BUZZ\n");}
	elsif($a % 3 == 0) {print("FIZZ\n");}
	else               {print("$a\n");}
}
