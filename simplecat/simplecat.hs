import System.Environment;
main :: IO ();
main = getArgs >>= readFile . head >>= putStr;
