main :: IO ();
main = getLine >>= \a -> putStrLn $ reverse a;
