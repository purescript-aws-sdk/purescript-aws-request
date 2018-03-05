module Test.Main where

import Prelude (Unit, bind, pure, unit, ($), (==))
import Control.Monad.Aff (Aff, Fiber, attempt, launchAff, throwError)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Exception (EXCEPTION, Error, error, message)
import Data.Either (Either(..))

import AWS.Request (request)
import AWS.Request.Types (noInput, encodeNoInput, decodeNoInput)

main :: forall eff. Eff (exception :: EXCEPTION, console :: CONSOLE | eff) (Fiber (exception :: EXCEPTION, console :: CONSOLE | eff) Unit)
main = launchAff do
    _ <- testRequestUnknownService
    _ <- liftEff $ log "OK. testRequestUnknownService"
    _ <- testRequestUnknownMethod
    _ <- liftEff $ log "OK. testRequestUnknownMethod"
    _ <- testRequestMissingParameters
    _ <- liftEff $ log "OK. testRequestMissingParameters"

    pure unit

testRequestUnknownService :: forall eff. Aff (exception :: EXCEPTION | eff) Unit
testRequestUnknownService = do
    errOrSuccess :: Either Error Unit <- attempt $ request encodeNoInput decodeNoInput "unknown" "" noInput
    case errOrSuccess of
        Right succ -> throwError $ error "AWS service unknown shouldn't exist"
        Left err -> if (message err) == "awsSdk[serviceName] is not a constructor"
            then pure unit
            else throwError err

testRequestUnknownMethod :: forall eff. Aff (exception :: EXCEPTION | eff) Unit
testRequestUnknownMethod = do
    errOrSuccess :: Either Error Unit <- attempt $ request encodeNoInput decodeNoInput "S3" "unknown" noInput
    case errOrSuccess of
        Right succ -> throwError $ error "AWS S3 method unknown shouldn't exist"
        Left err -> if (message err) == "awsService[methodName] is not a function"
            then pure unit
            else throwError err

testRequestMissingParameters :: forall eff. Aff (exception :: EXCEPTION | eff) Unit
testRequestMissingParameters = do
    errOrSuccess :: Either Error Unit <- attempt $ request encodeNoInput decodeNoInput "S3" "getBucketVersioning" noInput
    case errOrSuccess of
        Right succ -> throwError $ error "AWS S3 getBucketVersioning should require parameters"
        Left err -> if (message err) == "Missing required key 'Bucket' in params"
            then pure unit
            else throwError err
