module Luhn (isValid) where
import Data.Char (isDigit, digitToInt, isSpace)
import Data.Foldable (foldr')

isValid :: String -> Bool
isValid card_number = length cleaned > 1 && only_digits && result `mod` 10 == 0
  where
    cleaned = filter (not . isSpace) card_number
    only_digits = all isDigit cleaned
    result = snd (foldr' (\c (on, acc) -> (not on, acc + double c on)) (False, 0) cleaned)

    double :: Char -> Bool -> Int
    double c double_on
      | not double_on = digit
      | digit <= 4    = digit * 2
      | otherwise     = digit * 2 - 9
      where
        digit = digitToInt c
