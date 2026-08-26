module Isogram (isIsogram) where
import Data.Char ( toLower, isLetter )
import qualified Data.Set as Set

isIsogram :: String -> Bool
isIsogram text = length filtered == Set.size regrouped
  where
    filtered = filter isLetter . map toLower $ text 
    regrouped = Set.fromList filtered
