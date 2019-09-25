## Module AWS.Service

#### `genericEncode`

``` purescript
genericEncode :: forall a rep. Generic a rep => GenericEncode rep => a -> Foreign
```

#### `OptionsType`

``` purescript
type OptionsType = { accessKeyId :: Maybe String, apiVersion :: Maybe String, computeChecksums :: Maybe Boolean, convertResponseTypes :: Maybe Boolean, correctClockSkew :: Maybe Boolean, dynamoDbCrc32 :: Maybe Boolean, endpoint :: Maybe String, httpOptions :: Maybe HttpOptions, maxRedirects :: Maybe Int, maxRetries :: Maybe Int, paramValidation :: Maybe ParamValidation, params :: Maybe (Object String), region :: Maybe String, retryDelayOptions :: Maybe RetryDelayOptions, s3BucketEndpoint :: Maybe Boolean, s3DisableBodySigning :: Maybe Boolean, s3ForcePathStyle :: Maybe Boolean, secretAccessKey :: Maybe String, signatureCache :: Maybe Boolean, signatureVersion :: Maybe String, sslEnabled :: Maybe Boolean, systemClockOffset :: Maybe Int }
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
type ParamValidationType = { enum :: Maybe Boolean, max :: Maybe Boolean, min :: Maybe Boolean, pattern :: Maybe Boolean }
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
type HttpOptionsType = { connectTimeout :: Maybe Int, proxy :: Maybe String, timeout :: Maybe Int, xhrAsync :: Maybe Boolean, xhrWithCredentials :: Maybe Boolean }
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
serviceImpl :: String -> Foreign -> Effect Foreign
```

#### `service`

``` purescript
service :: ServiceName -> Options -> Effect Service
```


