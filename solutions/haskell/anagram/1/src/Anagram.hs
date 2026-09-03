module Anagram (anagramsFor) where
import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor word = next word_lower word_sorted
  where
    word_lower = map toLower word
    word_sorted = sort word_lower

    next :: String -> String -> [String] -> [String]
    next _ _ [] = []
    next lower sorted (x:xs)
      | lower /= x_lower && sorted == x_sorted = x : next lower sorted xs
      | otherwise = next lower sorted xs
      where
        x_lower = map toLower x
        x_sorted = sort x_lower
