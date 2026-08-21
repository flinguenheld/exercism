module Acronym (abbreviate) where
import Data.Char (isSpace, toUpper, isLower, isUpper)

abbreviate :: String -> String
abbreviate text = toUpper (head text) : sub text
  where 
    sub :: String -> String
    sub (x:y:xs)
      | isLower x && isUpper y = save_and_run
      | isSeparator x && not (isSeparator y) = save_and_run
      | otherwise = sub (y : xs)
      where
        isSeparator c = isSpace c || c == '-' || c == '_'
        save_and_run = toUpper y : sub xs
    sub _ = ""
