module ResistorColors (Color(..), Resistor(..), label, ohms) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

label :: Resistor -> String
label resistor
  | value >= 1000000000 = show (div value 1000000000) ++ " gigaohms"
  | value >= 1000000 = show (div value 1000000) ++ " megaohms"
  | value >= 1000 = show (div value 1000) ++ " kiloohms"
  | otherwise = show value ++ " ohms"
  where value = ohms resistor


ohms :: Resistor -> Int
ohms resistor = (fromEnum a * 10 + fromEnum b) * 10 ^ fromEnum p
  where
  (a, b, p) = bands resistor
