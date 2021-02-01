fib :: [Integer];
fib = 0 : 1 : zipWith (+) fib (tail fib);

main :: IO ();
main = mapM print fib;
