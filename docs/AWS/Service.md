## Module AWS.Service

#### `genericEncode`

``` purescript
genericEncode :: forall a rep. Generic a rep => GenericEncode rep => a -> Foreign
```

#### `OptionsType`

``` purescript
type OptionsType = { params :: Maybe (StrMap String), endpoint :: Maybe String, accessKeyId :: Maybe String, secretAccessKey :: Maybe String, region :: Maybe String, maxRetries :: Maybe Int, maxRedirects :: Maybe Int, sslEnabled :: Maybe Boolean, paramValidation :: Maybe ParamValidation, computeChecksums :: Maybe Boolean, convertResponseTypes :: Maybe Boolean, correctClockSkew :: Maybe Boolean, s3ForcePathStyle :: Maybe Boolean, s3BucketEndpoint :: Maybe Boolean, s3DisableBodySigning :: Maybe Boolean, retryDelayOptions :: Maybe RetryDelayOptions, httpOptions :: Maybe HttpOptions, apiVersion :: Maybe String, apiVersions :: Maybe (StrMap String), systemClockOffset :: Maybe Int, signatureVersion :: Maybe String, signatureCache :: Maybe Boolean, dynamoDbCrc32 :: Maybe Boolean }
```

#### `Options`

``` purescript
newtype Options
  = Options OptionsType
```

##### Instances
``` purescript
Newtype Options _
Generic Options _
Show Options
Encode Options
```

#### `defaultOptions`

``` purescript
defaultOptions :: Options
```

#### `defaultOptions'`

``` purescript
defaultOptions' :: (OptionsType -> OptionsType) -> Options
```

#### `ParamValidationType`

``` purescript
type ParamValidationType = { min :: Maybe Boolean, max :: Maybe Boolean, pattern :: Maybe Boolean, enum :: Maybe Boolean }
```

#### `ParamValidation`

``` purescript
newtype ParamValidation
  = ParamValidation ParamValidationType
```

##### Instances
``` purescript
Newtype ParamValidation _
Generic ParamValidation _
Show ParamValidation
Encode ParamValidation
```

#### `defaultParamValidation`

``` purescript
defaultParamValidation :: ParamValidation
```

#### `defaultParamValidation'`

``` purescript
defaultParamValidation' :: (ParamValidationType -> ParamValidationType) -> ParamValidation
```

#### `RetryDelayOptionsType`

``` purescript
type RetryDelayOptionsType = { base :: Maybe Int }
```

#### `RetryDelayOptions`

``` purescript
newtype RetryDelayOptions
  = RetryDelayOptions RetryDelayOptionsType
```

##### Instances
``` purescript
Newtype RetryDelayOptions _
Generic RetryDelayOptions _
Show RetryDelayOptions
Encode RetryDelayOptions
```

#### `defaultRetryDelayOptions`

``` purescript
defaultRetryDelayOptions :: RetryDelayOptions
```

#### `defaultRetryDelayOptions'`

``` purescript
defaultRetryDelayOptions' :: (RetryDelayOptionsType -> RetryDelayOptionsType) -> RetryDelayOptions
```

#### `HttpOptionsType`

``` purescript
type HttpOptionsType = { proxy :: Maybe String, connectTimeout :: Maybe Int, timeout :: Maybe Int, xhrAsync :: Maybe Boolean, xhrWithCredentials :: Maybe Boolean }
```

#### `HttpOptions`

``` purescript
newtype HttpOptions
  = HttpOptions HttpOptionsType
```

##### Instances
``` purescript
Newtype HttpOptions _
Generic HttpOptions _
Show HttpOptions
Encode HttpOptions
```

#### `defaultHttpOptions`

``` purescript
defaultHttpOptions :: HttpOptions
```

#### `defaultHttpOptions'`

``` purescript
defaultHttpOptions' :: (HttpOptionsType -> HttpOptionsType) -> HttpOptions
```

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

#### `serviceImpl`

``` purescript
serviceImpl :: forall eff. String -> Foreign -> Eff (exception :: EXCEPTION | eff) Foreign
```

#### `service`

``` purescript
service :: forall eff. ServiceName -> Options -> Eff (exception :: EXCEPTION | eff) Service
```


