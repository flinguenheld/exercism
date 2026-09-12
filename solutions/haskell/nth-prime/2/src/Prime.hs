module Prime (nth) where

nth :: Integer -> Maybe Integer
nth position
  | position <= 0 = Nothing
  | position == 1 = Just 2
  | otherwise     = Just $ eratosthenes !! (fromInteger position - 1)
  where
    eratosthenes = sieve [2..]
    sieve (x:xs) = x : sieve [v | v <- xs, v `mod` x /= 0]

