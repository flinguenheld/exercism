module Triangle (TriangleType(..), triangleType) where
import Data.List (nub)

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c =
      if not valid then 
         Illegal
      else
         case length $ nub values of
            1 -> Equilateral
            2 -> Isosceles
            _ -> Scalene
  where
    values = [a, b, c]
    total = sum values
    valid = all (>0) values && all (\v -> total - v >= v) values
