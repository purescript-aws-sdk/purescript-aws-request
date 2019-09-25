module Test.Main where

import Prelude
import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Class.Console (log)
import Effect.Aff (Fiber, launchAff)

import Test.AWS.Service as Service
import Test.AWS.Request as Request

main :: Effect (Fiber Unit)
main = launchAff do
    _ <- liftEffect Service.main
    _ <- log "OK. AWS.Service"
    _ <- Request.main
    _ <- log "OK. AWS.Request"

    pure unit
