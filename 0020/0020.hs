import System.Environment;
import System.Exit;
import System.IO;

main :: IO ();
main = getArgs >>= llll . (!! 0);

llll :: String -> IO ();
llll fn = hIsEOF stdin >>= \theend ->
  if theend
    then getLine >>= ptswlt fn >> llll fn
    else exitSuccess;

-- "PTSWLT" is an abbreviation of "print the stuff what like tee".
ptswlt :: FilePath -> String -> IO ();
ptswlt fn str = putStrLn str >> writeFile fn (str ++ "\n");
