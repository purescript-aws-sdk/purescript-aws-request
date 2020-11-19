module Test.AWS.Service where

import Prelude

import AWS.Service (httpOptions, service)
import Data.Either (Either(..))
import Effect (Effect)
import Effect.Exception (message, throw, throwException, try)

main :: Effect Unit
main = do
    _ <- testUnknownService
    _ <- testUpdateOptions
    pure unit

testUnknownService :: Effect Unit
testUnknownService = do
    errOrSuccess <- try $ service "unknown" {}
    case errOrSuccess of
        Right succ -> throw "AWS service unknown shouldn't exist"
        Left err -> if (message err) == "awsSdk[serviceName] is not a constructor"
            then pure unit
            else throwException err

testUpdateOptions :: Effect Unit
testUpdateOptions = do
  _ <- service "S3" { httpOptions: httpOptions { proxy: "new-proxy" } }
  pure unit
