import System.Environment;
main = getArgs >>= readFile . head >>= putStr;
