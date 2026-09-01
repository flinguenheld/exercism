module Triangle (rows) where
import Data.Foldable (foldl')

rows :: Int -> [[Integer]]
rows 0 = []
rows x = reverse $ foldl' (\acc _ -> next_row (head acc) : acc) [[1]] [2..x]
    where
      next_row :: [Integer] -> [Integer]
      next_row p = 1 : zipWith (+) p (tail p) ++ [1]
