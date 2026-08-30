module ProteinTranslation(proteins) where

proteins :: String -> Maybe [String]
proteins [] = Nothing
proteins xs = Just (go xs)

  where
    go :: String -> [String]
    go txt = case codonToAmino (take 3 txt) of
      [] -> []
      v  -> v : go (drop 3 txt)

      where
        codonToAmino :: String -> String
        codonToAmino codon = case codon of
          "AUG"                                     -> "Methionine"
          "UGG"                                     -> "Tryptophan"
          c | c `elem` ["UUU", "UUC"]               -> "Phenylalanine"
          c | c `elem` ["UAU", "UAC"]               -> "Tyrosine"
          c | c `elem` ["UGU", "UGC"]               -> "Cysteine"
          c | c `elem` ["UUA", "UUG"]               -> "Leucine"
          c | c `elem` ["UCU", "UCC", "UCA", "UCG"] -> "Serine"
          _                                         -> ""

