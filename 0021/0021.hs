import System.Environment;

main :: IO ();
main = getEnvironment >>= mapM_ (\a -> putStrLn $ fst a ++ "=" ++ snd a);
