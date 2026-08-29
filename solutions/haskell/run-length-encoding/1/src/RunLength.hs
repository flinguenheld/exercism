module RunLength (decode, encode) where
import Data.Char (isDigit)
import Data.Foldable (foldl')

decode :: String -> String
decode encodedText = fst (foldl' (\(acc, acc_nb) c -> accumulate (acc, acc_nb) c) ("", "") encodedText)
  where
  accumulate :: (String, String) -> Char -> (String, String)
  accumulate (text, number) current
    | isDigit current = (text, number ++ [current])
    | null number     = (text ++ [current], "")
    | otherwise       = (text ++ replicate (read number) current, "")

encode :: String -> String
encode [] = ""
encode text = fst (foldl' (\(acc, (acc_nb, saved)) c -> accumulate (acc, (acc_nb, saved)) c) ("", (0, head text)) (text ++ "\0"))
  where
    accumulate :: (String, (Int, Char)) -> Char -> (String, (Int, Char))
    accumulate (t, (number, saved)) current
      | current == saved  = (t, (number + 1, saved))
      | number == 1       = (t ++ [saved], (1, current))
      | otherwise         = (t ++ show number ++ [saved], (1, current))

