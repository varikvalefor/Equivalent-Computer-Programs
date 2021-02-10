import System.Environment;

seqx :: String -> String;
seqx k = foldr (++) [] $ map show [1..(read k :: Integer)];

main :: IO ();
main = getArgs >>= \a -> putStrLn $ seqx $ a !! 0;
