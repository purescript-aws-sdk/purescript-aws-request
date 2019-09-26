module AWS.Request.Types where

import Prelude

import Data.DateTime.Instant (Instant)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Foreign (unsafeToForeign, unsafeReadTagged)
import Simple.JSON (class ReadForeign, class WriteForeign)

newtype NoArguments = NoArguments {}
derive instance repGenericNoArguments :: Generic NoArguments _
instance showNoArguments :: Show NoArguments where show = genericShow
instance readNoArguments :: ReadForeign NoArguments where readImpl _ = pure $ NoArguments {}
instance writeNoArguments :: WriteForeign NoArguments where writeImpl _ = unsafeToForeign {}

newtype Timestamp = Timestamp Instant
derive instance repGenericTimestamp :: Generic Timestamp _
instance showTimestamp :: Show Timestamp where show = genericShow
instance readTimestamp :: ReadForeign Timestamp where readImpl = unsafeReadTagged "Date"
instance writeTimestamp :: WriteForeign Timestamp where writeImpl = unsafeToForeign
