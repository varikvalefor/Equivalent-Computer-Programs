theSquirts :: Integer -> Integer;
theSquirts k
  | k < 2^29-1 = floor $ sqrt $ fromIntegral k
  | otherwise  = read $ take (length b `div` 2 + 1) b
    where b = show k

isPrime :: Integer -> Bool;
isPrime = (== []) . factors
  where factors k = [l | l <- [2..theSquirts k], mod k l == 0]

main :: IO [()];
main = mapM print $ filter isPrime [2..];

