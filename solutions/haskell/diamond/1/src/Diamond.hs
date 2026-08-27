module Diamond (diamond) where
import Data.Char (ord, chr, isAsciiUpper)

diamond :: Char -> Maybe [String]
diamond c 
  | c == 'A' = Just ["A"]
  | isAsciiUpper c = Just (run 'A' True)
  | otherwise = Nothing

  where
    run :: Char -> Bool -> [String]
    run current up
      | up && current == c       = newLine current  ++ run next_char False
      | up                       = newLine current ++ run previous_char True
      | not up && current == 'A' = newLine current
      | not up                   = newLine current ++ run next_char False
      | otherwise = []

      where
        next_char = chr (ord current - 1)
        previous_char = chr (ord current + 1)

        indexOf :: Char -> Int
        indexOf letter = ord letter - ord 'A'

        line_length = (indexOf c - 1) * 2
        newLine :: Char -> [String]
        newLine ch
          | ch == 'A' = [spaces nb_outer ++ [ch] ++ spaces nb_outer]
          | otherwise = [spaces nb_outer ++ [ch] ++ spaces nb_inner ++ [ch] ++ spaces nb_outer]

          where
            nb_inner = (indexOf ch - 1) * 2
            nb_outer = div (line_length - 2 - nb_inner) 2

            spaces :: Int -> String
            spaces to = foldl (\acc _ -> ' ' : acc) "" [0..to]

