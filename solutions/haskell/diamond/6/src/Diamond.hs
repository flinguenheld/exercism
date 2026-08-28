module Diamond (diamond) where
import Data.Char (ord, chr, isAsciiUpper)

diamond :: Char -> Maybe [String]
diamond c 
  -- | c == 'A' = Just ["A"]
  | isAsciiUpper c = Just (run 0 True)
  | otherwise = Nothing

  where
    run :: Int -> Bool -> [String]
    run curr up
      | maxi == 0 || not up && curr == 0 = [newLine curr]
      | up && curr == maxi               = newLine curr : run (curr - 1) False
      | up                               = newLine curr : run (curr + 1) True
      | otherwise                        = newLine curr : run (curr - 1) False

      where
        space = ' '
        maxi = ord c - ord 'A'
        line_length = maxi * 2 + 1

        newLine :: Int -> String
        newLine ch
          | ch == 0 = outer ++ "A" ++ outer
          | otherwise = outer ++ letter ++ inner ++ letter ++ outer

          where
            letter = [chr (ord 'A' + ch)]
            nb_inner = ch * 2 - 1
            inner = replicate nb_inner space
            outer = replicate (div (line_length - 2 - nb_inner) 2) space
