import System.Environment;

main :: IO ();
main = getArgs >>= \a ->
  putStrLn $ foldr (++) [] $ map (show) [1..read (a !! 0)];
  {- [1..read (a !! 0)] generates a list of all integers between
  1 and the first argument of the program.
  map (show) converts the aforementioned list of integers into a
  list of decimal representations of these integers.
  foldr (++) [] performs a rightward concatenation on the resulting
  [String].
  putStrLn prints this String to the console. -}
