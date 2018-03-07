module AWS.Request ( ServiceName
                   , MethodName
                   , request
                   , nouJust
                   , nouNothing
                   ) where

import Control.Monad.Aff (Aff)
import Control.Monad.Aff.Compat (EffFnAff, fromEffFnAff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Foreign (Foreign)
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import F (liftF)
import Prelude
import Data.Maybe (Maybe(..))

newtype ServiceName = ServiceName String
newtype MethodName = MethodName String

foreign import requestImpl :: forall eff. String -> String -> Foreign -> EffFnAff (exception :: EXCEPTION | eff) Foreign
request :: forall eff i o. Encode i => Decode o => ServiceName -> MethodName -> i -> Aff (exception :: EXCEPTION | eff) o
request (ServiceName service) (MethodName method) i = do
    let fi = encode i
    fo <- requestImpl service method fi # fromEffFnAff
    decode fo # liftF # liftEff

nouJust :: forall a. a -> NullOrUndefined a
nouJust = NullOrUndefined <<< Just

nouNothing :: forall a. NullOrUndefined a
nouNothing = NullOrUndefined Nothing
