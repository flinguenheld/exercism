module Bob (responseFor) where
import Data.Char (isAsciiLower, isAsciiUpper, isSpace)
import Safe (lastMay)

responseFor :: String -> String
responseFor xs
  | is_yelling && is_question = "Calm down, I know what I'm doing!"
  | is_yelling = "Whoa, chill out!"
  | is_question = "Sure."
  | null no_space = "Fine. Be that way!"
  | otherwise = "Whatever."
  where
    is_yelling = not (any isAsciiLower no_space) && any isAsciiUpper no_space
    -- is_question = not (null no_space) && last no_space == '?'
    is_question = lastMay no_space == Just '?'
    no_space = filter (not . isSpace) xs
