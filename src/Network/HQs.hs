module Network.HQs
  where

import Data.Char (chr, isAsciiLower, isAsciiUpper, isDigit, ord)
import Numeric (showHex)

-- |
-- URL encodes a string
urlEncode :: String -> String
urlEncode = foldr urlEncodeUnit ""

-- |
-- URL encodes a character and appends it into a result string
urlEncodeUnit :: Char -> String -> String
urlEncodeUnit c m | isUnreserved c = c : m
urlEncodeUnit c m = '%' : if i > 16 then hex m else '0':hex m
  where i = ord c
        hex = showHex i

-- |
-- Whether a character is not safe for use in a QueryString
isReserved :: Char -> Bool
isReserved = not . isUnreserved

-- |
-- Whether a character is safe for use in a QueryString
isUnreserved :: Char -> Bool
isUnreserved c | isAsciiLower c || isAsciiUpper c || isDigit c = True
               | c <= chr 0x20 || c >= chr 0x7f = False -- Control chars
               | otherwise = c `notElem` ";/?:@&=+,${}|\\^[]`<>#%\""
