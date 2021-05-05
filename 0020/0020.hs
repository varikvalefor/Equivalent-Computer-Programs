import System.Environment;
import System.Exit;
import System.IO;

main :: IO ();
main = getArgs >>= llll . (!! 0);
-- The first argument is the only really useful bit.

llll :: String -> IO ();
llll fn = hIsEOF stdin >>= \theend ->
  if theend
    then getLine >>= ptswlt fn >> llll fn
    else exitSuccess;
  {- The program quits if the EOF character is input but otherwise
  reads a line, runs ptswlt on fn and this line, and runs llll again. -}

-- "PTSWLT" is an abbreviation of "print the stuff what like tee".
ptswlt :: FilePath -> String -> IO ();
ptswlt fn str = putStrLn str >> writeFile fn (str ++ "\n");
-- str is output to the console and file fn.
