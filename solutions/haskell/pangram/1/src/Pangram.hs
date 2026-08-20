module Pangram (isPangram) where
import qualified Data.Set as Set
import Data.Char (toLower)

isPangram :: String -> Bool
isPangram [] = False
isPangram text = my_set == to_compare
  where
    to_compare = Set.fromList "abcdefghijklmnopqrstuvwxyz"
    lower = map toLower text
    filtered = filter (>= 'a') lower
    filtered_again = filter (<= 'z') filtered
    my_set = Set.fromList filtered_again
