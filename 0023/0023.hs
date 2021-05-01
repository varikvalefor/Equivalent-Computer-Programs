import Control.Monad;
import System.Directory;
import System.Environment;

main :: IO ();
main = getArgs >>= k . g
  where
    k = mapM_ (getDirectoryContents >=> mapM_ putStrLn . drop 2)
    g [] = "."
    g x = x;
