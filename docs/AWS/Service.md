## Module AWS.Service

#### `Options`

``` purescript
type Options = { params :: Maybe (StrMap String), endpoint :: Maybe String, accessKeyId :: Maybe String, secretAccessKey :: Maybe String, region :: Maybe String, maxRetries :: Maybe Int, maxRedirects :: Maybe Int, sslEnabled :: Maybe Boolean, paramValidation :: Maybe ParamValidation, computeChecksums :: Maybe Boolean, convertResponseTypes :: Maybe Boolean, correctClockSkew :: Maybe Boolean, s3ForcePathStyle :: Maybe Boolean, s3BucketEndpoint :: Maybe Boolean, s3DisableBodySigning :: Maybe Boolean, retryDelayOptions :: Maybe RetryDelayOptions, httpOptions :: Maybe HttpOptions, apiVersion :: Maybe String, apiVersions :: Maybe (StrMap String), systemClockOffset :: Maybe Int, signatureVersion :: Maybe String, signatureCache :: Maybe Boolean, dynamoDbCrc32 :: Maybe Boolean }
```

#### `options`

``` purescript
options :: Options
```

#### `ParamValidation`

``` purescript
type ParamValidation = { min :: Maybe Boolean, max :: Maybe Boolean, pattern :: Maybe Boolean, enum :: Maybe Boolean }
```

#### `paramValidation`

``` purescript
paramValidation :: ParamValidation
```

#### `RetryDelayOptions`

``` purescript
type RetryDelayOptions = { base :: Maybe Int }
```

#### `retryDelayOptions`

``` purescript
retryDelayOptions :: RetryDelayOptions
```

#### `HttpOptions`

``` purescript
type HttpOptions = { proxy :: Maybe String, connectTimeout :: Maybe Int, timeout :: Maybe Int, xhrAsync :: Maybe Boolean, xhrWithCredentials :: Maybe Boolean }
```

#### `httpOptions`

``` purescript
httpOptions :: HttpOptions
```

#### `Service`

``` purescript
type Service = Foreign
```

#### `ServiceName`

``` purescript
type ServiceName = String
```

#### `serviceImpl`

``` purescript
serviceImpl :: forall eff. String -> Foreign -> Eff (exception :: EXCEPTION | eff) Foreign
```

#### `service`

``` purescript
service :: forall eff. ServiceName -> Options -> Eff (exception :: EXCEPTION | eff) Service
```


