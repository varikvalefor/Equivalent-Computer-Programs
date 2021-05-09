import System.Environment;

main :: IO ();
main = getEnvironment >>= mapM_ (\a -> putStrLn $ fst a ++ "=" ++ snd a);
{- For all K in getEnvironment, K is a 2-sequence of the name of an
environment variable and the value of this evironment variable.

For all k in getEnvironment, "=" is placed between (fst k) and (snd k);
the resulting string is printed to the console. -}
