module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = inner factors limit []
  where
    inner :: [Integer] -> Integer -> [Integer] -> Integer
    inner [] _ _ = 0
    inner (factor: factors) limit done = go factor + inner factors limit (factor : done)
      where
        go :: Integer -> Integer
        go current
          | current == 0 = 0
          | current >= limit = 0
          | otherwise = value + go (current + factor)
          where
            value = if all (\x -> mod current x /= 0) done then current else 0


