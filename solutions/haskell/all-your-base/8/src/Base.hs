module Base (Error(..), rebase) where
import Data.List (find, foldl')

data Error a = InvalidInputBase | InvalidOutputBase | InvalidDigit a
    deriving (Show, Eq)

rebase :: (Integral a) => a -> a -> [a] -> Either (Error a) [a]
rebase inBase outBase inDigits
    | inBase <= 1                            = Left InvalidInputBase
    | outBase <= 1                           = Left InvalidOutputBase
    | Just n <- invalid                      = Left $ InvalidDigit n
    | otherwise                              = Right $ build decimal
    where
        build = loop []
          where
            loop acc 0 = acc
            loop acc n = loop (n `mod` outBase : acc) (n `quot` outBase)

        decimal = foldl' (\n x -> inBase * n + x) 0 inDigits
        invalid = find (\x -> x < 0 || x >= inBase) inDigits
