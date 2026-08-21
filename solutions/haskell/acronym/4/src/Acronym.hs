module Acronym (abbreviate) where
import Data.Char (isSpace, toUpper, isLower, isUpper)

abbreviate :: String -> String
abbreviate text = toUpper (head text) : sub text
  where 
    sub :: String -> String
    sub xs = case xs of
        (a:b:cd)  | isLower a && isUpper b -> toUpper b : sub cd
                  | isSeparator a && not (isSeparator b) -> toUpper b : sub cd
                  | otherwise -> sub (b : cd)
                    where
                      isSeparator c = isSpace c || c == '-' || c == '_'
        _ -> ""
