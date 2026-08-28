module IsbnVerifier (isbn) where
import Data.Char (isDigit, digitToInt)
import Data.List (foldl')

isbn :: String -> Bool
isbn code = format_ok && all_digit_ok && total `mod` 11 == 0
  where
    format_ok = length code == 10
            || (length code == 13 && all (=='-') [code !! 1, code !! 5, code !! 11])

    reversed = foldl' (\acc v -> if v /= '-' then v : acc else acc) [] code
    all_digit_ok = (head reversed == 'X' || isDigit (head reversed))
            && all isDigit (tail reversed)

    first_one = if head reversed == 'X' then [10] else [digitToInt (head reversed)]
    digits = first_one ++ map digitToInt (tail reversed)
    total = fst (foldl' (\(acc, index) v -> (acc + (index * v), index + 1)) (0, 1) digits)
