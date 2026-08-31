module Triangle (rows) where
import Data.Foldable (foldl')

rows :: Int -> [[Integer]]
rows 0 = []
rows 1 = [[1]]
rows x = foldl' (\acc _ -> acc ++ [newLine (last acc)]) [[1]] [1..(x - 1)]
  where
    newLine :: [Integer] -> [Integer]
    newLine b = 1 : build b
      where
        build :: [Integer] -> [Integer]
        build [] = [1]
        build (y:z:ys) = (y + z) : build (z : ys)
        build (_:_) = [1]
