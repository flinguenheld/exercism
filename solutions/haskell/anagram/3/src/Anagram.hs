module Anagram (anagramsFor) where
import Data.Char (toLower)
import Data.List (sort)


anagramsFor :: String -> [String] -> [String]
anagramsFor word = filter isAnagram
  where
    word_lower = map toLower word
    word_sorted = sort word_lower

    isAnagram :: String -> Bool
    isAnagram current = word_lower /= curr_lower && word_sorted == curr_sorted
      where
        curr_lower = map toLower current
        curr_sorted = sort curr_lower
