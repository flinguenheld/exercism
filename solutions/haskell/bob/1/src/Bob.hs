module Bob (responseFor) where
import Data.Char (isAsciiLower, isAsciiUpper, isSpace)

responseFor :: String -> String
responseFor xs
  | is_yelling && is_question = "Calm down, I know what I'm doing!"
  | is_yelling = "Whoa, chill out!"
  | is_question = "Sure."
  | null no_space = "Fine. Be that way!"
  | otherwise = "Whatever."
  where
    is_yelling = not (null upper_only) && null lower_only 
    is_question = not (null no_space) && last no_space == '?'

    no_space = filter (\x -> not (isSpace x)) xs
    upper_only = filter isAsciiUpper no_space
    lower_only = filter isAsciiLower no_space
