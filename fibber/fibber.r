print(0);
print(1);
a <- c(0,1);
while(a[[1]] + a[[2]] != Inf)
{
	c <- a[[1]] + a[[2]];
	a <- c(a[[2]], c);
	print(c);
}
