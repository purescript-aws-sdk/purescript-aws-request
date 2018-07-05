module Test.AWS.Request where

import Prelude (Unit, bind, pure, unit, ($), (==))
import Control.Monad.Aff (Aff, attempt, throwError)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Exception (EXCEPTION, Error, error, message)
import Data.Either (Either(..))
import Data.Foreign (Foreign)

import AWS.Service (service, options)
import AWS.Request (request)

main :: forall eff. Aff (exception :: EXCEPTION | eff) Unit
main = do
    _ <- testRequestUnknownMethod
    _ <- testRequestMissingParameters

    pure unit

testRequestUnknownMethod :: forall eff. Aff (exception :: EXCEPTION | eff) Unit
testRequestUnknownMethod = do
    s3 <- liftEff $ service "S3" options
    errOrSuccess :: Either Error Foreign <- attempt $ request s3 "unknown" unit
    case errOrSuccess of
        Right succ -> throwError $ error "AWS S3 method unknown shouldn't exist"
        Left err -> if (message err) == "service[methodName] is not a function"
            then pure unit
            else throwError err

testRequestMissingParameters :: forall eff. Aff (exception :: EXCEPTION | eff) Unit
testRequestMissingParameters = do
    s3 <- liftEff $ service "S3" options
    errOrSuccess :: Either Error Foreign <- attempt $ request s3 "getBucketVersioning" unit
    case errOrSuccess of
        Right succ -> throwError $ error "AWS S3 getBucketVersioning should require parameters"
        Left err -> if (message err) == "Missing required key 'Bucket' in params"
            then pure unit
            else throwError err
