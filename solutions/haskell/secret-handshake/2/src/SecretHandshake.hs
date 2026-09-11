module SecretHandshake (handshake) where
import Data.Bits
import Data.Foldable (foldr')

handshake :: Int -> [String]
handshake num = foldr' (\(v, t) acc -> if num .&. v == v then t : acc else acc) [] hands
  where
    hands = if num .&. 16 == 16 then reverse actions else actions
    actions = [(1, "wink"),
               (2, "double blink"),
               (4, "close your eyes"),
               (8, "jump")]
