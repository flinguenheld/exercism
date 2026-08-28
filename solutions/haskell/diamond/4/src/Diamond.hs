module Diamond (diamond) where
import Data.Char (ord, chr, isAsciiUpper)

diamond :: Char -> Maybe [String]
diamond c 
  | c == 'A' = Just ["A"]
  | isAsciiUpper c = Just (run 0 True)
  | otherwise = Nothing

  where
    run :: Int -> Bool -> [String]
    run current up = buildLine current : case (current, up) of
      (curr, True)  | curr == maxi -> run (current - 1) False
      (_,    True)                 -> run (current + 1) True
      (curr, False) | curr == 0    -> []
      (_,    False)                -> run (current - 1) False

      where
        space = ' '
        maxi = ord c - ord 'A'
        line_length = maxi * 2 + 1

        buildLine :: Int -> String
        buildLine ch
          | ch == 0 = spaces_outer ++ "A" ++ spaces_outer
          | otherwise = spaces_outer ++ letter ++ spaces_inner ++ letter ++ spaces_outer

          where
            letter = [chr (ord 'A' + ch)]
            nb_inner = ch * 2 - 1
            spaces_inner = replicate nb_inner space
            spaces_outer = replicate (div (line_length - 2 - nb_inner) 2) space
