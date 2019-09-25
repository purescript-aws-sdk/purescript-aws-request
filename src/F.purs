module F where

import Prelude
import Control.Monad.Except (runExcept)
import Data.Array (snoc)
import Data.Either (Either(..))
import Data.List.NonEmpty (foldl)
import Data.String (joinWith)
import Effect (Effect)
import Effect.Exception (throw)
import Foreign (F, renderForeignError)

liftF :: forall a. F a -> Effect a
liftF f = case runExcept f of
    Right identity -> pure identity
    Left exceptions -> exceptions
        # foldl (snoc) []
        # map renderForeignError
        # joinWith "\n"
        # throw
