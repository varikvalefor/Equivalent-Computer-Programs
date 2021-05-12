faq :: Integer -> Integer;
faq k = product [2..k];
-- For all integers k, faq k equals the factorial of k.

main :: IO ();
main = mapM_ (print . faq) [1..];
-- For all j in [1..], faq j is output to the terminal.
