module Isogram (isIsogram) where
import Data.Char ( toLower, isLetter )
import qualified Data.Set as Set

isIsogram :: String -> Bool
isIsogram [] = True
isIsogram text = length filtered == length regrouped
  where
    filtered = filter isLetter . map toLower $ text 
    regrouped = Set.fromList filtered
