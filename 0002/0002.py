#Python belongs in Hell.
from math import sqrt
def isPrime(k):
    l=2
    while(l<sqrt(k)):
        if(k%l==0):
            return 0
        l=l+1
    return 1
i=1
while(i > 0):
    if(isPrime(i)):
        print(i)
    i=i+1
