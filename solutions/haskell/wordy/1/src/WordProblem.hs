module WordProblem (answer) where
import Data.List.Split (splitWhen)
import Data.Char (isDigit, isSpace)
import Data.Maybe (isNothing, fromJust)

answer :: String -> Maybe Integer
answer problem = getFirstNum fields
  where
    cleaned = filter (`notElem` "?!") problem
    allowed_op = ["plus", "minus", "multiplied", "divided", "cubed"]
    fields = filter isFieldOk $ splitWhen isSpace cleaned
      where
        isFieldOk s = all (\c -> isDigit c || c == '-') s || s `elem` allowed_op

    getFirstNum :: [String] -> Maybe Integer
    getFirstNum [] = Nothing
    getFirstNum (x: xs) = case readNum x of
                      Just v -> loop xs v
                      Nothing -> Nothing

    loop :: [String] -> Integer -> Maybe Integer
    loop (x:y:xs) acc = case calculate acc x y of
                            Just v ->  loop xs v
                            Nothing -> Nothing
    loop (_: _) _ = Nothing
    loop [] acc = Just acc

    readNum :: String -> Maybe Integer
    readNum xs
      | not valid = Nothing
      | negative  = Just $ read (tail xs) * (-1)
      | otherwise = Just $ read xs
      where
        negative = head xs == '-'
        valid    = all isDigit (if negative then tail xs else xs)

    calculate :: Integer -> String -> String -> Maybe Integer
    calculate left op right
      | isNothing r        = Nothing
      | op == "plus"       = Just $ left + fromJust r
      | op == "minus"      = Just $ left - fromJust r
      | op == "multiplied" = Just $ left * fromJust r
      | op == "divided"    = Just $ left `quot` fromJust r
      | otherwise          = Nothing
      where
        r = readNum right
