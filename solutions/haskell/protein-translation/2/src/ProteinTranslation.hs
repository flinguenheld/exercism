module ProteinTranslation(proteins) where

proteins :: String -> Maybe [String]
proteins xs = case codonToAmino (take 3 xs) of
  a | null a -> Just []
  a -> fmap (a :) (proteins (drop 3 xs))

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
