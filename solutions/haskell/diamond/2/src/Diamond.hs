module Diamond (diamond) where
import Data.Char (ord, chr, isAsciiUpper)

diamond :: Char -> Maybe [String]
diamond c 
  | c == 'A' = Just ["A"]
  | isAsciiUpper c = Just (run 'A' True)
  | otherwise = Nothing

  where
    line_length = (ord c - ord 'A' - 1) * 2

    run :: Char -> Bool -> [String]
    run current up = buildLine current ++ case (current, up) of
      (curr, True)  | curr == c   -> run next_char False
      (_,    True)                -> run previous_char True
      (curr, False) | curr == 'A' -> []
      (_,    False)               -> run next_char False

      where
        next_char = chr (ord current - 1)
        previous_char = chr (ord current + 1)

        buildLine :: Char -> [String]
        buildLine ch
          | ch == 'A' = [spaces_outer ++ [ch] ++ spaces_outer]
          | otherwise = [spaces_outer ++ [ch] ++ buildSpaces nb_inner ++ [ch] ++ spaces_outer]

          where
            nb_inner = (ord ch - ord 'A' - 1) * 2
            spaces_outer = buildSpaces (div (line_length - 2 - nb_inner) 2)

            buildSpaces :: Int -> String
            buildSpaces to = foldl (\acc _ -> ' ' : acc) "" [0..to]

