module Darts (score) where

score :: Float -> Float -> Int
score x y = get_score (sqrt (x * x + y * y))
  where
    get_score :: Float -> Int
    get_score d
              | d <= 1 = 10
              | d <= 5 = 5
              | d <= 10 = 1
              | otherwise = 0
