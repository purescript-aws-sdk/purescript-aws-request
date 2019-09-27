## Module AWS.Service

#### `OptionsType`

``` purescript
type OptionsType = (accessKeyId :: String, apiVersion :: ApiVersion, apiVersions :: Object ApiVersion, computeChecksums :: Boolean, convertResponseTypes :: Boolean, correctClockSkew :: Boolean, dynamoDbCrc32 :: Boolean, endpoint :: String, httpOptions :: HttpOptions, maxRedirects :: Int, maxRetries :: Int, paramValidation :: ParamValidation, params :: Object String, region :: String, retryDelayOptions :: RetryDelayOptions, s3BucketEndpoint :: Boolean, s3DisableBodySigning :: Boolean, s3ForcePathStyle :: Boolean, secretAccessKey :: String, signatureCache :: Boolean, signatureVersion :: String, sslEnabled :: Boolean, systemClockOffset :: Int)
```

#### `Options`

``` purescript
data Options :: Type
```

#### `options`

``` purescript
options :: forall o _o. Union o _o OptionsType => Record o -> Options
```

#### `ParamValidationType`

``` purescript
type ParamValidationType = (enum :: Boolean, max :: Boolean, min :: Boolean, pattern :: Boolean)
```

#### `ParamValidation`

``` purescript
data ParamValidation :: Type
```

#### `IsParamValidation`

``` purescript
class IsParamValidation a 
```

##### Instances
``` purescript
IsParamValidation Boolean
(Union o _o ParamValidationType) => IsParamValidation (Record o)
```

#### `paramValidation`

``` purescript
paramValidation :: forall a. IsParamValidation a => a -> ParamValidation
```

#### `RetryDelayOptionsType`

``` purescript
type RetryDelayOptionsType = (base :: Int, customBackoff :: Int -> Number)
```

#### `RetryDelayOptions`

``` purescript
data RetryDelayOptions :: Type
```

#### `retryDelayOptions`

``` purescript
retryDelayOptions :: forall o _o. Union o _o RetryDelayOptionsType => Record o -> RetryDelayOptions
```

#### `HttpOptionsType`

``` purescript
type HttpOptionsType = (connectTimeout :: Int, proxy :: String, timeout :: Int, xhrAsync :: Boolean, xhrWithCredentials :: Boolean)
```

#### `HttpOptions`

``` purescript
data HttpOptions :: Type
```

#### `httpOptions`

``` purescript
httpOptions :: forall o _o. Union o _o HttpOptionsType => Record o -> HttpOptions
```

#### `ApiVersion`

``` purescript
data ApiVersion :: Type
```

#### `IsApiVersion`

``` purescript
class IsApiVersion a 
```

##### Instances
``` purescript
IsApiVersion String
IsApiVersion JSDate
```

#### `apiVersion`

``` purescript
apiVersion :: forall a. IsApiVersion a => a -> ApiVersion
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
service :: forall o _o. Union o _o OptionsType => ServiceName -> Record o -> Effect Service
```

#### `service'`

``` purescript
service' :: ServiceName -> Options -> Effect Service
```


