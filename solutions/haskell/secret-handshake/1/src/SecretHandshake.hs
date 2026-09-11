module SecretHandshake (handshake) where
import Data.Bits

handshake :: Int -> [String]
handshake num = filter (not . null) $ if rev then reverse actions else actions
  where
    rev = num .&. 16 == 16
    actions = [getAction 1 "wink",
               getAction 2 "double blink",
               getAction 4 "close your eyes",
               getAction 8 "jump"]

    getAction flag value = if num .&. flag == flag then value else ""
