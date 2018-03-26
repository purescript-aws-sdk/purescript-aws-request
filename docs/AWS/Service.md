## Module AWS.Service

#### `Service`

``` purescript
newtype Service
  = Service Foreign
```

#### `ServiceName`

``` purescript
newtype ServiceName
  = ServiceName String
```

#### `Options`

``` purescript
type Options = { params :: NullOrUndefined (StrMap String), endpoint :: NullOrUndefined String, accessKeyId :: NullOrUndefined String, secretAccessKey :: NullOrUndefined String, region :: NullOrUndefined String, maxRetries :: NullOrUndefined Int, maxRedirects :: NullOrUndefined Int, sslEnabled :: NullOrUndefined Boolean, paramValidation :: NullOrUndefined (StrMap Boolean), computeChecksums :: NullOrUndefined Boolean, convertResponseTypes :: NullOrUndefined Boolean, correctClockSkew :: NullOrUndefined Boolean, s3ForcePathStyle :: NullOrUndefined Boolean, s3BucketEndpoint :: NullOrUndefined Boolean, s3DisableBodySigning :: NullOrUndefined Boolean, retryDelayOptions :: NullOrUndefined (StrMap Int), apiVersion :: NullOrUndefined String, apiVersions :: NullOrUndefined (StrMap String), systemClockOffset :: NullOrUndefined Int, signatureVersion :: NullOrUndefined String, signatureCache :: NullOrUndefined Boolean, dynamoDbCrc32 :: NullOrUndefined Boolean }
```

#### `service`

``` purescript
service :: forall eff. ServiceName -> Options -> Eff (exception :: EXCEPTION | eff) Service
```

#### `defaultOptions`

``` purescript
defaultOptions :: Options
```


