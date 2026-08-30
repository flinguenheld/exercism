module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA = traverse (\c -> case convert c of
                          v | v == c -> Left c
                          v -> Right v)
  where
    convert :: Char -> Char
    convert c
      | c == 'G' = 'C'
      | c == 'C' = 'G'
      | c == 'T' = 'A'
      | c == 'A' = 'U'
      | otherwise = c
