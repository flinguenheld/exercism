module IsbnVerifier (isbn) where
import Data.Char (isDigit, digitToInt)

isbn :: String -> Bool
isbn code = format_ok && all_digit_ok && total `mod` 11 == 0
  where
    format_ok = length code == 10
            || (length code == 13 && all (=='-') [code !! 1, code !! 5, code !! 11])

    x = last code
    cleaned = filter (/= '-') (take 12 code)
    all_digit_ok = (x == 'X' || isDigit x) && all isDigit cleaned

    first = if x == 'X' then 10 else digitToInt x
    total = sum (map (\(c, i) -> digitToInt c * i) (zip cleaned (reverse [2..10]))) + first
