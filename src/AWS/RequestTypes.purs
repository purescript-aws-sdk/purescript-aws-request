module AWS.Request.Types where

import Prelude
import Data.Foreign (toForeign)
import AWS.Request (Decode, Encode)

noInput = unit :: Unit
decodeNoInput :: Decode Unit
decodeNoInput _ = pure unit
encodeNoInput :: Encode Unit
encodeNoInput _ = toForeign unit

noOutput = unit :: Unit
decodeNoOutput :: Decode Unit
decodeNoOutput _ = pure unit
encodeNoOutput :: Encode Unit
encodeNoOutput _ = toForeign unit
