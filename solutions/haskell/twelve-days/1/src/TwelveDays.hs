module TwelveDays (recite) where

recite :: Int -> Int -> [String]
recite start stop =  take (stop - start + 1) $ drop (start - 1) carol

  where
    carol =  [
               "On the first"    ++ day_of ++ "a Partridge in a Pear Tree."
             , "On the second"   ++ day_of ++ give_end 2
             , "On the third"    ++ day_of ++ give_end 3
             , "On the fourth"   ++ day_of ++ give_end 4
             , "On the fifth"    ++ day_of ++ give_end 5
             , "On the sixth"    ++ day_of ++ give_end 6
             , "On the seventh"  ++ day_of ++ give_end 7
             , "On the eighth"   ++ day_of ++ give_end 8
             , "On the ninth"    ++ day_of ++ give_end 9
             , "On the tenth"    ++ day_of ++ give_end 10
             , "On the eleventh" ++ day_of ++ give_end 11
             , "On the twelfth"  ++ day_of ++ give_end 12
             ]
    day_of = " day of Christmas my true love gave to me: "

    give_end :: Int -> String
    give_end 0 = []
    give_end n = end n ++ give_end (n - 1)

    end :: Int -> String
    end n =  case n of
      1  -> "and a Partridge in a Pear Tree."
      2  -> "two Turtle Doves, "
      3  -> "three French Hens, "
      4  -> "four Calling Birds, "
      5  -> "five Gold Rings, "
      6  -> "six Geese-a-Laying, "
      7  -> "seven Swans-a-Swimming, " 
      8  -> "eight Maids-a-Milking, "
      9  -> "nine Ladies Dancing, "
      10 -> "ten Lords-a-Leaping, "
      11 -> "eleven Pipers Piping, "
      12 -> "twelve Drummers Drumming, " 
      _  -> ""  -- where
