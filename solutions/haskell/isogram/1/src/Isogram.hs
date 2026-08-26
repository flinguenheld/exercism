module Isogram (isIsogram) where
import Data.Char ( isSpace, toLower )

isIsogram :: String -> Bool
isIsogram [] = True
isIsogram text
  | checkOne text = isIsogram (tail text)
  | otherwise = False
  where
    checkOne :: String -> Bool
    checkOne [] = True
    checkOne (c:cs)
      | isSpace c || c == '-' = True
      | otherwise = all (\l -> toLower l /= low) cs
      where
        low = toLower c
