module Test.AWS.Service where

import Prelude (Unit, bind, pure, unit, ($), (==))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION, message, throw, throwException, try)
import Data.Either (Either(..))

import AWS.Service

main :: forall eff. Eff (exception :: EXCEPTION | eff) Unit
main = do
    _ <- testUnknownService
    pure unit

testUnknownService :: forall eff. Eff (exception :: EXCEPTION | eff) Unit
testUnknownService = do
    errOrSuccess <- try $ service "unknown" options
    case errOrSuccess of
        Right succ -> throw "AWS service unknown shouldn't exist"
        Left err -> if (message err) == "awsSdk[serviceName] is not a constructor"
            then pure unit
            else throwException err
