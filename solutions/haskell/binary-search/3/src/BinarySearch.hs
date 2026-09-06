module BinarySearch (find) where
import Data.Array

find :: Ord a => Array Int a -> a -> Maybe Int
find arr val = cut 0 (length arr - 1)

  where
    cut :: Int -> Int -> Maybe Int
    cut left right
      | left > right       = Nothing
      | val > middle_value = cut (middle_index+1) right
      | val < middle_value = cut left (middle_index-1)
      | otherwise          = Just middle_index
      where
        middle_index = (left + right) `quot` 2
        middle_value = arr ! middle_index
