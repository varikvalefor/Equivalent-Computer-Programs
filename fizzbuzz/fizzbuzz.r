a <- 0;
while(a != Inf)
{
	a = a+1;
	if(a%%15 == 0)     {print("FIZZ BUZZ");}
	else if(a%%5 == 0) {print("BUZZ");}
	else if(a%%3 == 0) {print("FIZZ");}
	else               {print(a);}
}
