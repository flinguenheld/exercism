module Acronym (abbreviate) where
import Data.Char (isSpace, toUpper, isLower, isUpper)

abbreviate :: String -> String
abbreviate xs = toUpper (head xs) : sub xs

  where 
    sub :: String -> String
    sub [] = ""
    sub (x:xs)
      | isLower x && not (null xs) && isUpper (head xs) = toUpper (head xs) : sub xs
      | isSeparator x && not (null xs) && not (isSeparator (head xs)) = toUpper (head xs) : sub xs
      | otherwise = sub xs

      where
        isSeparator c = isSpace c || c == '-' || c == '_'
