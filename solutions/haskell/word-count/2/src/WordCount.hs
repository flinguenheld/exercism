module WordCount (wordCount) where
import Data.List.Split (splitWhen)
import Data.Char (isSpace, toLower)
import Data.List (group, sort)


wordCount :: String -> [(String, Int)]
wordCount xs = map (\g -> (head g, length g)) groups
  where
    all_words = filter (not . null) $ splitWhen (\x -> isSpace x || x `elem` ":!?,&@$%^&.") xs
    groups = group $ sort $ map cleanWord all_words

    cleanWord :: String -> String
    cleanWord word
      | head word == '\'' = cleanWord $ tail word
      | last word == '\'' = cleanWord $ init word
      | otherwise         = map toLower word
