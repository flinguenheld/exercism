module WordProblem (answer) where
import Data.List.Split (splitWhen)
import Data.Char (isDigit, isSpace)

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
    getFirstNum (x:xs) = readNum x >>= \v -> loop xs v

    loop :: [String] -> Integer -> Maybe Integer
    loop (x:y:xs) acc = do
                    right <- readNum y
                    result <- calculate acc x right
                    loop xs result
    loop (_: _) _ = Nothing
    loop [] acc = Just acc

    readNum :: String -> Maybe Integer
    readNum ('-':xs) = if all isDigit xs then Just $ - read xs else Nothing
    readNum xs       = if all isDigit xs then Just $   read xs else Nothing

    calculate :: Integer -> String -> Integer -> Maybe Integer
    calculate left op right = case op of
       "plus"       -> Just $ left + right
       "minus"      -> Just $ left - right
       "multiplied" -> Just $ left * right
       "divided"    -> Just $ left `quot` right
       _            -> Nothing
