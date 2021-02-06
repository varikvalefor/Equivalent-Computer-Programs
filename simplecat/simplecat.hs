import System.Environment;
main = getArgs >>= \viet -> readFile (viet !! 0) >>= putStr;
