module Beer (song) where

song :: String
song = sing 99
       where
              sing :: Int -> String
              sing 1 = concat ["1", nos t1, end]
              sing 2 = concat ["2", t1, "2", t2, "1", nos t3, sing 1]
              sing n = concat [show n, t1, show n, t2, show (n-1), t3, sing (n-1)]

              nos = filter (/= 's')
              t1 = " bottles of beer on the wall, "
              t2 = " bottles of beer.\nTake one down and pass it around, "
              t3 = " bottles of beer on the wall.\n\n"
              end = "1 bottle of beer.\n\
       \Take it down and pass it around, no more bottles of beer on the wall.\n\
       \\n\
       \No more bottles of beer on the wall, no more bottles of beer.\n\
       \Go to the store and buy some more, 99 bottles of beer on the wall.\n"

