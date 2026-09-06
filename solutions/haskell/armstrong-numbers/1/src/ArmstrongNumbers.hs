module ArmstrongNumbers (armstrong) where

-- armstrong :: Integral a => a -> Bool
armstrong :: Int -> Bool
armstrong value = sumDigits value == value
  where
    sumDigits :: Int -> Int
    sumDigits 0 = 0
    sumDigits n = ((n `mod` 10) ^ len) + sumDigits (n `div` 10)

    len = getLen value

    getLen :: Int -> Int
    getLen 0 = 0
    getLen l = 1 + getLen (l `quot` 10)
