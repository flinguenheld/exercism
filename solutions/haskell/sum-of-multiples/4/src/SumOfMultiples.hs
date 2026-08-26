module SumOfMultiples (sumOfMultiples) where
import qualified Data.Set as Set

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum values
  where
    getValues :: [Integer] -> Set.Set Integer
    getValues [] = Set.empty 
    getValues (x:xs)
      | x == 0 = getValues xs
      | otherwise = Set.union (Set.fromAscList [ x * n | n <- [1..(div (limit - 1) x)]])  (getValues xs)

    values = getValues factors

