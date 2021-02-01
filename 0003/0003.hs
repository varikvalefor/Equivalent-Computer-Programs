import System.Environment;

main :: IO ();
main = getArgs >>= \a ->
  putStrLn $ foldr (++) [] $ map (show) [1..read (a !! 0)];
