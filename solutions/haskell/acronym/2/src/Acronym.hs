module Acronym (abbreviate) where
import Data.Char (isSpace, toUpper, isLower, isUpper)

abbreviate :: String -> String
abbreviate text = toUpper (head text) : sub text
  where 
    sub :: String -> String
    sub [] = ""
    sub (x:xs)
      | null xs = ""
      | isLower x && isUpper (head xs) = save_and_run
      | isSeparator x && not (isSeparator (head xs)) = save_and_run
      | otherwise = sub xs
      where
        isSeparator c = isSpace c || c == '-' || c == '_'
        save_and_run = toUpper (head xs) : sub xs
