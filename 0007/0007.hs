f :: Integer -> [Char];
f uck = foldr (++) "" $ map show $ [1..uck];

main :: IO [()];
main = mapM (putStrLn . f) [1..];
