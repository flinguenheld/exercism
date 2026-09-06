module Hamming (distance) where
import Data.Foldable (foldl')

distance :: String -> String -> Maybe Int
distance xs ys
  | length xs /= length ys = Nothing
  | otherwise = Just (foldl' (\acc (o,t) -> acc + fromEnum (o /= t)) 0 (zip xs ys))
