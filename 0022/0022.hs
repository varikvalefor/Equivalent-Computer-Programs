import Control.Concurrent;

main :: IO ();
main = mapM_ (\k -> putStr [k] >> threadDelay 100000)
  "We are the music makers." >> putStrLn "" >> main;
