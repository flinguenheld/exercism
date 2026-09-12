module Beer (song) where

song :: String
song = sing 99
  where
    sing :: Int -> String
    sing 0 = end
    sing n = concat [line1, line2, "\n\n", sing (n-1)]
      where
        line1 = concat [bot n, " on the wall, ", bot n, ".\n"]
        line2 = case n of
          1 -> "Take it down and pass it around, no more bottles of beer on the wall."
          _ -> concat ["Take one down and pass it around, ", bot (n-1), " on the wall."]

    bot :: Int -> String
    bot num
      | num == 1  = "1 bottle of beer"
      | otherwise = show num ++ " bottles of beer"

    end="No more bottles of beer on the wall, no more bottles of beer.\n\
    \Go to the store and buy some more, 99 bottles of beer on the wall.\n"
