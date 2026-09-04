module Queens (boardString, canAttack) where

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = unlines [[square row col | col <- [0..14]] | row <- [0..7]]
  where
      square :: Int -> Int -> Char
      square row col
        | odd col          = ' '
        | current == white = 'W'
        | current == black = 'B'
        | otherwise        = '_'
        where
          current = Just (row, col `quot` 2)

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (row_w, col_w) (row_b, col_b)
  | row_w == row_b || col_w == col_b           = True
  | abs (row_b - row_w) == abs (col_b - col_w) = True
  | otherwise                                  = False
