module Triangle (rows) where
import Data.Foldable (foldl')

rows :: Int -> [[Integer]]
rows 0 = []
rows x = foldl' (\acc _ -> acc ++ [1 : build (last acc)]) [[1]] [1..(x - 1)]
    where
      build :: [Integer] -> [Integer]
      build (y:z:ys) = (y + z) : build (z : ys)
      build _ = [1]
