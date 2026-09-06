module TwelveDays (recite) where

recite :: Int -> Int -> [String]
recite start stop
  | start <= stop = ("On the " ++ num !! (start-1) ++ day_of ++ buildEnd (start-1)) : recite (start+1) stop
  | otherwise = []

  where
    buildEnd :: Int -> String
    buildEnd (-1) = []
    buildEnd n = end !! n ++ buildEnd (n-1)

    end = [
       "a Partridge in a Pear Tree.",
       "two Turtle Doves, and ",
       "three French Hens, ",
       "four Calling Birds, ",
       "five Gold Rings, ",
       "six Geese-a-Laying, ",
       "seven Swans-a-Swimming, " ,
       "eight Maids-a-Milking, ",
       "nine Ladies Dancing, ",
       "ten Lords-a-Leaping, ",
       "eleven Pipers Piping, ",
       "twelve Drummers Drumming, " ]
    day_of = " day of Christmas my true love gave to me: "
    num =  [ "first", "second", "third", "fourth", "fifth", "sixth",
             "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth" ]
