module F where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION, throw)
import Control.Monad.Except (runExcept)
import Data.Array (snoc)
import Data.Either (Either(..))
import Data.Foreign (F, renderForeignError)
import Data.List.NonEmpty (foldl)
import Data.String (joinWith)

liftF :: forall eff a. F a -> Eff (exception :: EXCEPTION | eff) a
liftF f = case runExcept f of
    Right identity -> pure identity
    Left exceptions -> exceptions
        # foldl (snoc) []
        # map renderForeignError
        # joinWith "\n"
        # throw


