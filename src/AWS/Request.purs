module AWS.Request (Encode, Decode, request) where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Aff.Compat (EffFnAff, fromEffFnAff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Foreign (Foreign)

type Encode a = a -> Foreign
type Decode a = forall eff. Foreign -> Eff (exception :: EXCEPTION | eff) a

foreign import requestImpl :: forall eff. String -> String -> Foreign -> EffFnAff (exception :: EXCEPTION | eff) Foreign
request :: forall eff i o. Encode i -> Decode o -> String -> String -> i -> Aff (exception :: EXCEPTION | eff) o
request encode decode service method i = do
    let fi = encode i
    fo <- requestImpl service method fi # fromEffFnAff
    decode fo # liftEff
