module IsbnVerifier (isbn) where
import Data.Char (isDigit, digitToInt)

isbn :: String -> Bool
isbn code = format_ok && all_digit_ok && total `mod` 11 == 0
  where
    format_ok = length code == 10
            || (length code == 13 && all (== '-') [code !! 1, code !! 5, code !! 11])

    x = case last code of
      l | isDigit l -> digitToInt l
      l | l == 'X'  -> 10
      _             -> -1

    cleaned = filter (/= '-') (take 12 code)
    all_digit_ok = x > 0 && all isDigit cleaned
    total = x + sum (zipWith (\c i -> digitToInt c * i) cleaned (reverse [2..10]))
