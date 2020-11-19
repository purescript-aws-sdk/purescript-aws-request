## Module AWS.Service

#### `Options`

``` purescript
type Options = { accessKeyId :: UndefinedOr String, apiVersion :: UndefinedOr ApiVersion, apiVersions :: UndefinedOr (Object ApiVersion), computeChecksums :: UndefinedOr Boolean, convertResponseTypes :: UndefinedOr Boolean, correctClockSkew :: UndefinedOr Boolean, dynamoDbCrc32 :: UndefinedOr Boolean, endpoint :: UndefinedOr String, httpOptions :: UndefinedOr HttpOptions, maxRedirects :: UndefinedOr Int, maxRetries :: UndefinedOr Int, paramValidation :: UndefinedOr (Boolean |+| ParamValidation), params :: UndefinedOr (Object String), region :: UndefinedOr String, retryDelayOptions :: UndefinedOr RetryDelayOptions, s3BucketEndpoint :: UndefinedOr Boolean, s3DisableBodySigning :: UndefinedOr Boolean, s3ForcePathStyle :: UndefinedOr Boolean, secretAccessKey :: UndefinedOr String, signatureCache :: UndefinedOr Boolean, signatureVersion :: UndefinedOr String, sslEnabled :: UndefinedOr Boolean, systemClockOffset :: UndefinedOr Int }
```

#### `ParamValidation`

``` purescript
type ParamValidation = { enum :: UndefinedOr Boolean, max :: UndefinedOr Boolean, min :: UndefinedOr Boolean, pattern :: UndefinedOr Boolean }
```

#### `paramValidation`

``` purescript
paramValidation :: forall a. Coercible a ParamValidation => a -> ParamValidation
```

#### `RetryDelayOptions`

``` purescript
type RetryDelayOptions = { base :: UndefinedOr Int, customBackoff :: Int -> UndefinedOr Number }
```

#### `retryDelayOptions`

``` purescript
retryDelayOptions :: forall a. Coercible a RetryDelayOptions => a -> RetryDelayOptions
```

#### `HttpOptions`

``` purescript
type HttpOptions = { connectTimeout :: UndefinedOr Int, proxy :: UndefinedOr String, timeout :: UndefinedOr Int, xhrAsync :: UndefinedOr Boolean, xhrWithCredentials :: UndefinedOr Boolean }
```

#### `httpOptions`

``` purescript
httpOptions :: forall a. Coercible a HttpOptions => a -> HttpOptions
```

#### `ApiVersion`

``` purescript
type ApiVersion = String |+| JSDate
```

#### `apiVersion`

``` purescript
apiVersion :: forall a. Coercible a ApiVersion => a -> ApiVersion
```

#### `Service`

``` purescript
data Service :: Type
```

#### `ServiceName`

``` purescript
type ServiceName = String
```

#### `service`

``` purescript
service :: forall r. Coercible r Options => ServiceName -> r -> Effect Service
```


