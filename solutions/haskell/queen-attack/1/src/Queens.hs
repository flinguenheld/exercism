module Queens (boardString, canAttack) where

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = build 0 0
  where
    build :: Int -> Int -> String
    build row col
      | row == 8   = []
      | col == 15  = '\n'   : build (row+1) 0
      | odd col    = ' '    : build row (col+1)
      | otherwise  = square : build row (col+1)
      where
        square = case Just (row, col `quot` 2) of
                  pt | pt == white -> 'W'
                  pt | pt == black -> 'B'
                  _                -> '_'

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (row_w, col_w) (row_b, col_b)
  | row_w == row_b || col_w == col_b           = True
  | abs (row_b - row_w) == abs (col_b - col_w) = True
  | otherwise                                  = False
