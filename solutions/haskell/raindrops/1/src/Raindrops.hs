module Raindrops (convert) where

convert :: Int -> String
convert n = if null value then show n else value
  where
    droping :: Int -> Int -> Char -> String
    droping val by c = if mod val by == 0 then "Pl" ++ [c] ++ "ng" else ""
    value = droping n 3 'i' ++ droping n 5 'a' ++ droping n 7 'o'
