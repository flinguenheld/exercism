module DNA (toRNA) where
import Data.Foldable (find)
import Data.Maybe (fromJust, isJust)

toRNA :: String -> Either Char String
toRNA xs
  | isJust wrong = Left (fromJust wrong)
  | otherwise = Right (map convert xs)
  where
    wrong = find (`notElem` "GCTA") xs

    convert :: Char -> Char
    convert c
      | c == 'G' = 'C'
      | c == 'C' = 'G'
      | c == 'T' = 'A'
      | otherwise = 'U'
