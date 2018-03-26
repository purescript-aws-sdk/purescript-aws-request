module AWS.Request ( MethodName(..)
                   , request
                   ) where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Aff.Compat (EffFnAff, fromEffFnAff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Foreign (Foreign)
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import F (liftF)

import AWS.Service (Service(..))

newtype MethodName = MethodName String

foreign import requestImpl :: forall eff. Foreign -> String -> Foreign -> EffFnAff (exception :: EXCEPTION | eff) Foreign
request :: forall eff i o. Encode i => Decode o => Service -> MethodName -> i -> Aff (exception :: EXCEPTION | eff) o
request (Service service) (MethodName method) i = do
    let fi = encode i
    fo <- requestImpl service method fi # fromEffFnAff
    decode fo # liftF # liftEff
