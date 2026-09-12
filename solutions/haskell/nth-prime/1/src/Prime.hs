module Prime (nth) where

nth :: Integer -> Maybe Integer
nth position
  | position <= 0 = Nothing
  | otherwise     = Just $ loop 2 1

  where
    loop :: Integer -> Integer -> Integer
    loop value index = case (isPrime value, index == position) of
      (True, True)  -> value
      (True, False) -> loop (value+1) (index+1)
      _             -> loop (value+1) index

    isPrime :: Integer -> Bool
    isPrime num
      | num == 2 || num == 5         = True
      | even num || num `mod` 5 == 0 = False
      | otherwise                    = all (\v -> num `mod` v /= 0) [2..maxi]
      where
        maxi =  round $ sqrt $ fromInteger num
