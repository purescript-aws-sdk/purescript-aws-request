module Test.AWS.Request where

import Prelude

import AWS.Request (request)
import AWS.Service (service)
import Data.Either (Either(..))
import Effect.Aff (Aff, attempt, throwError)
import Effect.Class (liftEffect)
import Effect.Exception (Error, error, message)
import Foreign (Foreign, unsafeToForeign)

main :: Aff Unit
main = do
    _ <- testRequestUnknownMethod
    _ <- testRequestMissingParameters

    pure unit

testRequestUnknownMethod :: Aff Unit
testRequestUnknownMethod = do
    s3 <- liftEffect $ service "S3" {}
    errOrSuccess :: Either Error Foreign <- attempt $ request s3 "unknown" (unsafeToForeign {})
    case errOrSuccess of
        Right succ -> throwError $ error "AWS S3 method unknown shouldn't exist"
        Left err -> if (message err) == "service[methodName] is not a function"
            then pure unit
            else throwError err

testRequestMissingParameters :: Aff Unit
testRequestMissingParameters = do
    s3 <- liftEffect $ service "S3" $ { paramValidation: true }
    errOrSuccess :: Either Error Foreign <- attempt $ request s3 "getBucketVersioning" (unsafeToForeign {})
    case errOrSuccess of
        Right succ -> throwError $ error "AWS S3 getBucketVersioning should require parameters"
        Left err -> if (message err) == "Missing required key 'Bucket' in params"
            then pure unit
            else throwError err
