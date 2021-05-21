dumbSum :: Integer -> Integer;
dumbSum k = sum [1..k];
{- For all natural numbers k, dumbSum k equals $\sum_{x=1}^k x$. -}

clevSum :: Integer -> Integer;
clevSum k = k * (k + 1) `div` 2;
{- For all natural numbers k, clevSum k equals
 - $\frac{k \cdot (k + 1)}{2}$, which equals $\sum_{x=1}^k x$. -}

main :: IO ();
main = mapM_ tp [1..6000];
{- For all $n \in \left\{n \in \mathbb N : 1 \leq n \leq 6000\right\}$,
 - \texttt{tp} $n$.  As such, $n$ is printed to the console. -}

tp :: Integer -> IO ();
tp k = putStrLn $ sx ++ ds ++ " = " ++ cs ++ "." where
  {- For all natural numbers k, tp k prints to the console the
   - concatenation of sx, ds, " = ", cs, and ".".
   - sx is the concatenation of "\sum{x=1}^{", sk, and "} x = ".
   - sk is the String representation of k.
   - ds is the String representation of dumbSum k.
   - cs is the String representation of clevSum k. -}
  sk = show k
  ds = show $ dumbSum k
  cs = show $ clevSum k
  sx = "\\sum_{x=1}^{" ++ sk ++ "} x = ";
