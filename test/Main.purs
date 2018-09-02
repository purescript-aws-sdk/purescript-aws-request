module Test.Main where

import Prelude (Unit, bind, pure, unit, ($))
import Effect.Aff (Fiber, launchAff)
import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Console (CONSOLE, log)
import Effect.Exception (EXCEPTION)

import Test.AWS.Service as Service
import Test.AWS.Request as Request

main :: forall eff. Effect (Fiber (exception :: EXCEPTION, console :: CONSOLE | eff) Unit)
main = launchAff do
    _ <- liftEffect Service.main
    _ <- liftEffect $ log "OK. AWS.Service"
    _ <- Request.main
    _ <- liftEffect $ log "OK. AWS.Request"

    pure unit
