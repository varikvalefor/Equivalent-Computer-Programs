import Control.Monad;
import System.Directory;
import System.Environment;

main :: IO ();
main = getArgs >>= \a ->
  if a == []
    then k ["."]
    else k a
  where k = mapM_ (getDirectoryContents >=> mapM_ putStrLn . drop 2);
