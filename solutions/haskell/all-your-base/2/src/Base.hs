module Base (Error(..), rebase) where
import Data.List (find, foldl')
import Data.Foldable (foldr')

data Error a = InvalidInputBase | InvalidOutputBase | InvalidDigit a
    deriving (Show, Eq)

-- rebase :: (Integral a) => a -> a -> [a] -> Either (Error a) [a]
rebase :: Integer -> Integer -> [Integer] -> Either (Error Integer) [Integer]
rebase inBase outBase inDigits
    | inBase <= 1                            = Left InvalidInputBase
    | outBase <= 1                           = Left InvalidOutputBase
    | Just n <- invalid                      = Left $ InvalidDigit n
    | null inDigits || all (==0) inDigits    = Right []
    | otherwise                              = Right $ build (getIndex 0) decimal
    where
        getIndex :: Integer -> Integer
        getIndex i
          | (outBase ^ i) - 1 >= decimal = i - 1
          | otherwise                       = getIndex (i + 1)

        build :: Integer -> Integer -> [Integer]
        build i rest
          | i == 0    = [fromIntegral rest]
          | otherwise = rest `quot` outBase ^ i : build (i-1) (rest `mod` outBase ^ i)

        -- decimal = fst $ foldr' (\n (acc, i) -> (acc + n * i, i * inBase)) (0, 1) inDigits
        decimal = foldl' (\n x -> inBase * n + x) 0 inDigits
        invalid = find (\x -> x < 0 || x >= inBase) inDigits
