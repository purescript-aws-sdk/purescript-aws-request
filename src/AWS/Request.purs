module AWS.Request
       ( MethodName
       , request
       , unsafeRequest
       ) where

import Prelude

import AWS.Service (Service)
import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)
import Foreign (Foreign)
import Unsafe.Coerce (unsafeCoerce)

type MethodName = String

foreign import requestImpl :: Service -> MethodName -> Foreign -> EffectFnAff Foreign

request :: Service -> MethodName -> Foreign -> Aff Foreign
request service methodName i =
  requestImpl service methodName i # fromEffectFnAff

--| Only call `unsafeRequest` for auto generated code that guarantees
--| that the `input` and `output` types are correct.
unsafeRequest :: forall input output. Service -> MethodName -> input -> Aff output
unsafeRequest = unsafeCoerce request
