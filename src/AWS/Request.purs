module AWS.Request ( MethodName(..)
                   , request
                   ) where

import Prelude
import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)
import Effect.Class (liftEffect)
import F (liftF)
import Foreign (Foreign)
import Foreign.Class (class Decode, class Encode, encode, decode)

import AWS.Service (Service(..))

newtype MethodName = MethodName String

foreign import requestImpl :: Foreign -> String -> Foreign -> EffectFnAff Foreign
request :: forall i o. Encode i => Decode o => Service -> MethodName -> i -> Aff o
request (Service service) (MethodName method) i = do
    let fi = encode i
    fo <- requestImpl service method fi # fromEffectFnAff
    decode fo # liftF # liftEffect
