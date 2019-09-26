module AWS.Request ( MethodName(..)
                   , request
                   ) where

import Prelude

import AWS.Service (Service(..))
import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)
import Effect.Class (liftEffect)
import F (liftF)
import Foreign (Foreign)
import Simple.JSON (class ReadForeign, class WriteForeign, readImpl, writeImpl)

newtype MethodName = MethodName String

foreign import requestImpl :: Foreign -> String -> Foreign -> EffectFnAff Foreign
request :: forall i o. WriteForeign i => ReadForeign o => Service -> MethodName -> i -> Aff o
request (Service service) (MethodName method) i = do
    let fi = writeImpl i
    fo <- requestImpl service method fi # fromEffectFnAff
    readImpl fo # liftF # liftEffect
