module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = keepDone factors []
  where
    keepDone :: [Integer] -> [Integer] -> Integer
    keepDone [] _  = 0
    keepDone (x: xs) done = addOneFactor x + keepDone xs (x : done)
      where
        addOneFactor :: Integer -> Integer
        addOneFactor current
          | current == 0 = 0
          | current >= limit = 0
          | otherwise = value + addOneFactor (current + x)
          where
            value = if all (\v -> mod current v /= 0) done then current else 0
