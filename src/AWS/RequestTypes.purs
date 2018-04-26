module AWS.Request.Types where

import Prelude

import Data.DateTime.Instant (Instant)
import Data.Foreign (toForeign, unsafeReadTagged)
import Data.Foreign.Class (class Decode, class Encode)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)

newtype NoArguments = NoArguments {}
derive instance repGenericNoArguments :: Generic NoArguments _
instance showNoArguments :: Show NoArguments where show = genericShow
instance decodeNoArguments :: Decode NoArguments where decode _ = pure $ NoArguments {}
instance encodeNoArguments :: Encode NoArguments where encode _ = toForeign {}

newtype Timestamp = Timestamp Instant
derive instance repGenericTimestamp :: Generic Timestamp _
instance showTimestamp :: Show Timestamp where show = genericShow
instance decodeTimestamp :: Decode Timestamp where decode = unsafeReadTagged "Date"
instance encodeTimestamp :: Encode Timestamp where encode = toForeign
