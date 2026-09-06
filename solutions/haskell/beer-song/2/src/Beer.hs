module Beer (song) where

song :: String
song = sing 99
  where
    sing :: Int -> String
    sing 0 = concat [bottle 0, wall, ".\n\nN", tail $ bottle 0, wall, ", ", bottle 0, ".\n", end]
    sing 1 = concat [bottle 1, wall, ", ", bottle 1, takeIt 1, sing 0]
    sing n = concat [bottle n, wall, ", ", bottle n, takeIt n, bottle (n-1), wall, ".\n\n", sing (n-1)]

    bottle :: Int -> String
    bottle num
      | num == 0  = "no more bottles of beer"
      | num == 1  = "1 bottle of beer"
      | otherwise = show num ++ " bottles of beer"

    takeIt :: Int -> String
    takeIt num
      | num == 1  = ".\nTake it down and pass it around, "
      | otherwise = ".\nTake one down and pass it around, "

    wall = " on the wall"
    end =  "Go to the store and buy some more, " ++ bottle 99 ++ wall ++ ".\n"
