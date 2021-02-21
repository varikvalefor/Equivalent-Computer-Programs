import System.Random;
main :: IO [()];
main = mapM k [1..]
  where k x = newStdGen >>= \a -> print $ head (randoms a :: [Integer])
