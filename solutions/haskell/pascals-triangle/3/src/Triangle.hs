module Triangle (rows) where
import Data.Foldable (foldl')

rows :: Int -> [[Integer]]
rows 0 = []
rows x = snd (foldl' (\(previous, acc) _ -> let p = (1 : build previous) in
                (p, acc ++ [p])) ([1], [[1]]) [1..(x-1)])
    where
      build :: [Integer] -> [Integer]
      build (y:z:ys) = (y + z) : build (z : ys)
      build _ = [1]
