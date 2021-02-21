import random

def k(a):
  if(a == 0): return -1
  if(a == 1): return 1

while(1):
  print(random.randrange(2**63) * k(random.randrange(2)))
