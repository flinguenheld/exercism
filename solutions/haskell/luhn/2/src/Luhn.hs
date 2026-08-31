module Luhn (isValid) where
import Data.Foldable (foldr')
import Data.Char (digitToInt, isSpace)

isValid :: String -> Bool
isValid card_number = length cleaned > 1 && result `mod` 10 == 0
  where
    cleaned = filter (not . isSpace) card_number
    result = snd (foldr' (\c (on, acc) -> (not on, acc + double c on)) (False, 0) cleaned)

    double :: Char -> Bool -> Int
    double c on
      | not on = digit
      | digit <= 4    = digit * 2
      | otherwise     = digit * 2 - 9
      where
        digit = digitToInt c
