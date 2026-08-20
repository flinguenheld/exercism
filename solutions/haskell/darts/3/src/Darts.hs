module Darts (score) where

score :: Float -> Float -> Int
score x y
  | radius <= 1 = 10
  | radius <= 5 = 5
  | radius <= 10 = 1
  | otherwise = 0
  where radius = sqrt(x**2 + y**2)
  
