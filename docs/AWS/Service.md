## Module AWS.Service

#### `genericEncode`

``` purescript
genericEncode :: forall a rep. Generic a rep => GenericEncode rep => a -> Foreign
```

#### `OptionsType`

``` purescript
type OptionsType = { params :: NullOrUndefined (StrMap String), endpoint :: NullOrUndefined String, accessKeyId :: NullOrUndefined String, secretAccessKey :: NullOrUndefined String, region :: NullOrUndefined String, maxRetries :: NullOrUndefined Int, maxRedirects :: NullOrUndefined Int, sslEnabled :: NullOrUndefined Boolean, paramValidation :: NullOrUndefined ParamValidation, computeChecksums :: NullOrUndefined Boolean, convertResponseTypes :: NullOrUndefined Boolean, correctClockSkew :: NullOrUndefined Boolean, s3ForcePathStyle :: NullOrUndefined Boolean, s3BucketEndpoint :: NullOrUndefined Boolean, s3DisableBodySigning :: NullOrUndefined Boolean, retryDelayOptions :: NullOrUndefined RetryDelayOptions, httpOptions :: NullOrUndefined HttpOptions, apiVersion :: NullOrUndefined String, apiVersions :: NullOrUndefined (StrMap String), systemClockOffset :: NullOrUndefined Int, signatureVersion :: NullOrUndefined String, signatureCache :: NullOrUndefined Boolean, dynamoDbCrc32 :: NullOrUndefined Boolean }
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
type ParamValidationType = { min :: NullOrUndefined Boolean, max :: NullOrUndefined Boolean, pattern :: NullOrUndefined Boolean, enum :: NullOrUndefined Boolean }
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
type RetryDelayOptionsType = { base :: NullOrUndefined Int }
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
type HttpOptionsType = { proxy :: NullOrUndefined String, connectTimeout :: NullOrUndefined Int, timeout :: NullOrUndefined Int, xhrAsync :: NullOrUndefined Boolean, xhrWithCredentials :: NullOrUndefined Boolean }
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


