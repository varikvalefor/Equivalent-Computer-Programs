import System.Environment;

seqx :: String -> String;
seqx k = foldr (++) [] $ map show [1..(read k :: Integer)];

main :: IO ();
main = getArgs >>= putStrLn . seqx . head;
