module WordCount (wordCount) where
import Data.Foldable (foldl')
import qualified Data.Set as Set
import Data.List.Split (splitWhen)
import Data.Char (isSpace, toLower)


wordCount :: String -> [(String, Int)]
wordCount xs = foldl' (\acc x -> (x, count x) : acc) [] keys 
  where
    all_words = filter (not . null) $ splitWhen (\x -> isSpace x || x `elem` ":!?,&@$%^&.") xs
    cleaned = map cleanWord all_words
    keys = Set.fromList cleaned

    cleanWord :: String -> String
    cleanWord word
      | head word == '\'' = cleanWord $ tail word
      | last word == '\'' = cleanWord $ init word
      | otherwise         = map toLower word

    count :: String -> Int
    count who = length $ filter (== who) cleaned
