module Beer (song) where

song :: String
song = sing 99
  where
    sing :: Int -> String
    sing n
      | n == 0    = concat [p1, p2, p3, p4]
      | otherwise = concat [p1, p2, p3, p4, sing (n-1)]
      where
        p1 = case n of
          0 -> "No more bottles of beer on the wall, "
          1 -> "1 bottle of beer on the wall, "
          _ -> show n ++ " bottles of beer on the wall, "
        p2 = case n of
          0 -> "no more bottles of beer.\n"
          1 -> "1 bottle of beer.\n"
          _ -> show n ++ " bottles of beer.\n"
        p3 = case n of
          0 -> "Go to the store and buy some more, "
          1 -> "Take it down and pass it around, "
          _ -> "Take one down and pass it around, "
        p4 = case n of
          0 -> "99 bottles of beer on the wall.\n"
          1 -> "no more bottles of beer on the wall.\n\n"
          2 -> "1 bottle of beer on the wall.\n\n"
          _ -> show (n-1) ++ " bottles of beer on the wall.\n\n"
