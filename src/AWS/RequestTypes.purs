module AWS.Request.Types
       ( Timestamp(..)
       ) where

import Prelude

import Data.DateTime.Instant (Instant)
import Data.Newtype (class Newtype)

newtype Timestamp = Timestamp Instant

derive instance timestampNewtype :: Newtype Timestamp _
instance showTimestamp :: Show Timestamp where
  show (Timestamp i) = "(Timestamp " <> show i <> ")"
