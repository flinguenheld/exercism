module Anagram (anagramsFor) where
import Data.Char (toLower)
import Data.List (sort)


anagramsFor :: String -> [String] -> [String]
anagramsFor word = filter isAnagram
  where
    word_lower = map toLower word
    word_sorted = sort word_lower

    isAnagram :: String -> Bool
    isAnagram w = word_lower /= x_lower && word_sorted == x_sorted
      where
        x_lower = map toLower w
        x_sorted = sort x_lower
