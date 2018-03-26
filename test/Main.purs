module Test.Main where

import Prelude (Unit, bind, pure, unit, ($))
import Control.Monad.Aff (Fiber, launchAff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Exception (EXCEPTION)

import Test.AWS.Service as Service
import Test.AWS.Request as Request

main :: forall eff. Eff (exception :: EXCEPTION, console :: CONSOLE | eff) (Fiber (exception :: EXCEPTION, console :: CONSOLE | eff) Unit)
main = launchAff do
    _ <- liftEff Service.main
    _ <- liftEff $ log "OK. AWS.Service"
    _ <- Request.main
    _ <- liftEff $ log "OK. AWS.Request"

    pure unit
