import System.Environment;

main :: IO ();
main = getArgs >>= \k ->
  print $ product [2..read $ k !! 0];
