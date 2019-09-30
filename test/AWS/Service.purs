module Test.AWS.Service where

import Prelude (Unit, bind, pure, unit, ($), (==))
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (message, throw, throwException, try)

import AWS.Service

main :: Effect Unit
main = do
    _ <- testUnknownService
    _ <- testUpdateOptions
    pure unit

testUnknownService :: Effect Unit
testUnknownService = do
    errOrSuccess <- try $ service (ServiceName "unknown") defaultOptions
    case errOrSuccess of
        Right succ -> throw "AWS service unknown shouldn't exist"
        Left err -> if (message err) == "awsSdk[serviceName] is not a constructor"
            then pure unit
            else throwException err

testUpdateOptions :: Effect Unit
testUpdateOptions = do
    let newHttpOptions = defaultHttpOptions' $ _ { proxy = Just "new-proxy" }
    let newOptions = defaultOptions' $ _ { httpOptions = Just newHttpOptions }
    _ <- service (ServiceName "S3") newOptions
    pure unit
