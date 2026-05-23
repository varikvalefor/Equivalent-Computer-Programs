import Control.Concurrent (threadDelay);

doit :: Int -> IO ();
doit x = threadDelay x >> print x;

main :: IO ();
main = mapM_ doit [0..] >> error "ni'o banzuka le ka ce'u barda kei le ka ce'u tolmapti tu'a lo me zo valsi namcu";
