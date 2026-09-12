module Base (Error(..), rebase) where
import Data.Maybe (fromJust, isJust)
import Data.List (find, foldl')

data Error a = InvalidInputBase | InvalidOutputBase | InvalidDigit a
    deriving (Show, Eq)

-- rebase :: (Integral a) => a -> a -> [a] -> Either (Error a) [a]
rebase :: Integer -> Integer -> [Integer] -> Either (Error Integer) [Integer]
rebase inBase outBase inDigits
    | inBase <= 1                            = Left InvalidInputBase
    | outBase <= 1                           = Left InvalidOutputBase
    | isJust invalid                         = Left (InvalidDigit (fromJust invalid))
    | null inDigits || all (==0) inDigits    = Right []
    | otherwise                              = Right (build (getIndex 0) decimal)
    -- | otherwise    = Right (fst $ foldl' build ([], decimal) (reverse [0..(getIndex 0)]))
    where
        getIndex :: Integer -> Integer
        getIndex i
          | (outBase ^ i) - 1 >= decimal = i - 1
          | otherwise                       = getIndex (i + 1)

        -- build :: ([Integer], Integer) -> Integer -> ([Integer], Integer)
        -- build (acc, rest) i = (acc ++ [rest `quot` outBase ^ i], rest `mod` outBase ^ i)

        build :: Integer -> Integer -> [Integer]
        build i rest
          | i == 0    = [fromIntegral rest]
          | otherwise = rest `quot` outBase ^ i : build (i-1) (rest `mod` outBase ^ i)

        decimal = sum $ zipWith (\d i -> d * inBase ^ i) (reverse inDigits) [0..]
        invalid = find (\x -> x < 0 || x >= inBase) inDigits
