module LeapYear (isLeapYear) where


isLeapYear :: Integer -> Bool
-- isLeapYear year = error "You need to implement this function."
isLeapYear year = year `mod` 4 == 0 && (year `mod` 100 /= 0 || year `mod` 400 == 0)


