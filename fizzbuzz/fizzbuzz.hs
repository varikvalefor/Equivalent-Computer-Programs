f :: Integer -> [Char];
f k
  | b 15 = "FIZZ BUZZ"
  | b 5  = "BUZZ"
  | b 3  = "FIZZ"
  | otherwise = show k
  where b x = mod k x == 0

main :: IO [()];
main = mapM (putStrLn . f) [1..];
