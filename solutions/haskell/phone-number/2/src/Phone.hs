module Phone (number) where
import Data.Char (isDigit)

number :: String -> Maybe String
number xs
  | country_ok && area_ok && exchange_ok = Just cleaned
  | otherwise = Nothing
  where
    (only_digits, len) = (filter isDigit xs, length only_digits)
    cleaned = if len == 11 then tail only_digits else only_digits

    country_ok = len == 10 || (len == 11 && head only_digits == '1')
    area_ok = head cleaned >= '2'
    exchange_ok = cleaned !! 3 >= '2'

