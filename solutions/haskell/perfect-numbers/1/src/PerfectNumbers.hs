module PerfectNumbers (classify, Classification(..)) where
import Data.Foldable (foldl')

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n <= 0    = Nothing
  | as < n    = Just Deficient
  | as > n    = Just Abundant
  | otherwise = Just Perfect
  where
    as = foldl' (\acc v -> if n `mod` v == 0 then acc + v else acc) 0 [1..(n-1)]
