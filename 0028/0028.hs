import Prelude hiding (readFile);
import System.Environment;
import Data.ByteString;
import Control.Monad;
import System.Exit;
import Data.Bool;

main :: IO ();
main = getArgs >>= (bool exitFailure exitSuccess . f <=< mapM readFile)
  where {
  f :: Eq a => [a] -> Bool;
  f (a : b : c) = a == b && f c;
  f _ = True;
};
