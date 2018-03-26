module NullOrUndefined where

import Prelude ((<<<))
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.Maybe (Maybe(..))

nouJust :: forall a. a -> NullOrUndefined a
nouJust = NullOrUndefined <<< Just

nouNothing :: forall a. NullOrUndefined a
nouNothing = NullOrUndefined Nothing
