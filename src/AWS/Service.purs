module AWS.Service where

import Prelude (class Show, bind, pure, ($))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Foreign (Foreign)
import Data.Foreign.Class (class Encode, encode)
import Data.Foreign.Generic as Generic
import Data.Foreign.Generic.Class (class GenericEncode)
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, over)
import Data.StrMap (StrMap)

genericEncode :: forall a rep. Generic a rep => GenericEncode rep => a -> Foreign
genericEncode = Generic.genericEncode $ Generic.defaultOptions { unwrapSingleConstructors = true }

-- params (map) — An optional map of parameters to bind to every request sent by this service object. For more information on bound parameters, see "Working with Services" in the Getting Started Guide.
-- endpoint (String) — The endpoint URI to send requests to. The default endpoint is built from the configured region. The endpoint should be a string like 'https://{service}.{region}.amazonaws.com'.
-- accessKeyId (String) — your AWS access key ID.
-- secretAccessKey (String) — your AWS secret access key.
-- sessionToken (AWS.Credentials) — the optional AWS session token to sign requests with.
-- credentials (AWS.Credentials) — the AWS credentials to sign requests with. You can either specify this object, or specify the accessKeyId and secretAccessKey options directly.
-- credentialProvider (AWS.CredentialProviderChain) — the provider chain used to resolve credentials if no static credentials property is set.
-- region (String) — the region to send service requests to. See AWS.ACM.region for more information.
-- maxRetries (Int) — the maximum amount of retries to attempt with a request. See AWS.ACM.maxRetries for more information.
-- maxRedirects (Int) — the maximum amount of redirects to follow with a request. See AWS.ACM.maxRedirects for more information.
-- sslEnabled (Boolean) — whether to enable SSL for requests.
-- paramValidation (Boolean|map) — whether input parameters should be validated against the operation description before sending the request.
-- computeChecksums (Boolean) — whether to compute checksums for payload bodies when the service accepts it (currently supported in S3 only)
-- convertResponseTypes (Boolean) — whether types are converted when parsing response data. Currently only supported for JSON based services. Turning this off may improve performance on large response payloads. Defaults to true.
-- correctClockSkew (Boolean) — whether to apply a clock skew correction and retry requests that fail because of an skewed client clock. Defaults to false.
-- s3ForcePathStyle (Boolean) — whether to force path style URLs for S3 objects.
-- s3BucketEndpoint (Boolean) — whether the provided endpoint addresses an individual bucket (false if it addresses the root API endpoint). Note that setting this configuration option requires an endpoint to be provided explicitly to the service constructor.
-- s3DisableBodySigning (Boolean) — whether S3 body signing should be disabled when using signature version v4. Body signing can only be disabled when using https. Defaults to true.
-- retryDelayOptions (map) — A set of options to configure the retry delay on retryable errors.
-- httpOptions (map) — A set of options to pass to the low-level HTTP request.
-- apiVersion (String, Date) — a String in YYYY-MM-DD format (or a date) that represents the latest possible API version that can be used in all services (unless overridden by apiVersions). Specify 'latest' to use the latest possible version.
-- apiVersions (map<String, String|Date>) — a map of service identifiers (the lowercase service class name) with the API version to use when instantiating a service. Specify 'latest' for each individual that can use the latest available version.
-- logger (#write, #log) — an object that responds to .write() (like a stream) or .log() (like the console object) in order to log information about requests
-- systemClockOffset (Number) — an offset value in milliseconds to apply to all signing times. Use this to compensate for clock skew when your system may be out of sync with the service time. Note that this configuration option can only be applied to the global AWS.config object and cannot be overridden in service-specific configuration. Defaults to 0 milliseconds.
-- signatureVersion (String) — the signature version to sign requests with (overriding the API configuration). Possible values are: 'v2', 'v3', 'v4'.
-- signatureCache (Boolean) — whether the signature to sign requests with (overriding the API configuration) is cached. Only applies to the signature version 'v4'. Defaults to true.
-- dynamoDbCrc32 (Boolean) — whether to validate the CRC32 checksum of HTTP response bodies returned by DynamoDB. Default: true.
type OptionsType =
    { params :: NullOrUndefined (StrMap String)
    , endpoint :: NullOrUndefined String
    , accessKeyId :: NullOrUndefined String
    , secretAccessKey :: NullOrUndefined String
    , region :: NullOrUndefined String
    , maxRetries :: NullOrUndefined Int
    , maxRedirects :: NullOrUndefined Int
    , sslEnabled :: NullOrUndefined Boolean
    , paramValidation :: NullOrUndefined ParamValidation
    , computeChecksums :: NullOrUndefined Boolean
    , convertResponseTypes :: NullOrUndefined Boolean
    , correctClockSkew :: NullOrUndefined Boolean
    , s3ForcePathStyle :: NullOrUndefined Boolean
    , s3BucketEndpoint :: NullOrUndefined Boolean
    , s3DisableBodySigning :: NullOrUndefined Boolean
    , retryDelayOptions :: NullOrUndefined RetryDelayOptions
    , httpOptions :: NullOrUndefined HttpOptions
    , apiVersion :: NullOrUndefined String
    , apiVersions :: NullOrUndefined (StrMap String)
    , systemClockOffset :: NullOrUndefined Int
    , signatureVersion :: NullOrUndefined String
    , signatureCache :: NullOrUndefined Boolean
    , dynamoDbCrc32 :: NullOrUndefined Boolean
    }

newtype Options = Options OptionsType
derive instance newtypeOptions :: Newtype Options _
derive instance repGenericOptions :: Generic Options _
instance showOptions :: Show Options where show = genericShow
instance encodeOptions :: Encode Options where encode = genericEncode

defaultOptions :: Options
defaultOptions = Options
    { params: NullOrUndefined Nothing
    , endpoint: NullOrUndefined Nothing
    , accessKeyId: NullOrUndefined Nothing
    , secretAccessKey: NullOrUndefined Nothing
    , region: NullOrUndefined Nothing
    , maxRetries: NullOrUndefined Nothing
    , maxRedirects: NullOrUndefined Nothing
    , sslEnabled: NullOrUndefined Nothing
    , paramValidation: NullOrUndefined Nothing
    , computeChecksums: NullOrUndefined Nothing
    , convertResponseTypes: NullOrUndefined Nothing
    , correctClockSkew: NullOrUndefined Nothing
    , s3ForcePathStyle: NullOrUndefined Nothing
    , s3BucketEndpoint: NullOrUndefined Nothing
    , s3DisableBodySigning: NullOrUndefined Nothing
    , retryDelayOptions: NullOrUndefined Nothing
    , httpOptions: NullOrUndefined Nothing
    , apiVersion: NullOrUndefined Nothing
    , apiVersions: NullOrUndefined Nothing
    , systemClockOffset: NullOrUndefined Nothing
    , signatureVersion: NullOrUndefined Nothing
    , signatureCache: NullOrUndefined Nothing
    , dynamoDbCrc32: NullOrUndefined Nothing
    }

defaultOptions' :: (OptionsType -> OptionsType) -> Options
defaultOptions' f = over Options f defaultOptions

-- Whether input parameters should be validated against the operation description before sending the request.
--   - min [Boolean] — Validates that a value meets the min constraint. This is enabled by default when paramValidation is set to true.
--   - max [Boolean] — Validates that a value meets the max constraint.
--   - pattern [Boolean] — Validates that a string value matches a regular expression.
--   - enum [Boolean] — Validates that a string value matches one of the allowable enum values.
type ParamValidationType =
    { min :: NullOrUndefined Boolean
    , max :: NullOrUndefined Boolean
    , pattern :: NullOrUndefined Boolean
    , enum :: NullOrUndefined Boolean
    }

newtype ParamValidation = ParamValidation ParamValidationType
derive instance newtypeParamValidation :: Newtype ParamValidation _
derive instance repGenericParamValidation :: Generic ParamValidation _
instance showParamValidation :: Show ParamValidation where show = genericShow
instance encodeParamValidation :: Encode ParamValidation where encode = genericEncode

defaultParamValidation :: ParamValidation
defaultParamValidation = ParamValidation
    { min: NullOrUndefined Nothing
    , max: NullOrUndefined Nothing
    , pattern: NullOrUndefined Nothing
    , enum: NullOrUndefined Nothing
    }

defaultParamValidation' :: (ParamValidationType -> ParamValidationType) -> ParamValidation
defaultParamValidation' f = over ParamValidation f defaultParamValidation

-- A set of options to configure the retry delay on retryable errors.
--   - base [Integer] — The base number of milliseconds to use in the exponential backoff for operation retries. Defaults to 100 ms for all services except DynamoDB, where it defaults to 50ms.
--   - customBackoff [function] — A custom function that accepts a retry count and returns the amount of time to delay in milliseconds. The base option will be ignored if this option is supplied.
type RetryDelayOptionsType =
    { base :: NullOrUndefined Int
    }

newtype RetryDelayOptions = RetryDelayOptions RetryDelayOptionsType
derive instance newtypeRetryDelayOptions :: Newtype RetryDelayOptions _
derive instance repGenericRetryDelayOptions :: Generic RetryDelayOptions _
instance showRetryDelayOptions :: Show RetryDelayOptions where show = genericShow
instance encodeRetryDelayOptions :: Encode RetryDelayOptions where encode = genericEncode

defaultRetryDelayOptions :: RetryDelayOptions
defaultRetryDelayOptions = RetryDelayOptions
    { base: NullOrUndefined Nothing
    }

defaultRetryDelayOptions' :: (RetryDelayOptionsType -> RetryDelayOptionsType) -> RetryDelayOptions
defaultRetryDelayOptions' f = over RetryDelayOptions f defaultRetryDelayOptions

-- A set of options to pass to the low-level HTTP request.
--   - proxy [String] — the URL to proxy requests through
--   - agent [http.Agent, https.Agent] — the Agent object to perform HTTP requests with. Used for connection pooling. Defaults to the global agent (http.globalAgent) for non-SSL connections. Note that for SSL connections, a special Agent object is used in order to enable peer certificate verification. This feature is only available in the Node.js environment.
--   - connectTimeout [Int] — Sets the socket to timeout after failing to establish a connection with the server after connectTimeout milliseconds. This timeout has no effect once a socket connection has been established.
--   - timeout [Int] — Sets the socket to timeout after timeout milliseconds of inactivity on the socket. Defaults to two minutes (120000).
--   - xhrAsync [Boolean] — Whether the SDK will send asynchronous HTTP requests. Used in the browser environment only. Set to false to send requests synchronously. Defaults to true (async on).
--   - xhrWithCredentials [Boolean] — Sets the "withCredentials" property of an XMLHttpRequest object. Used in the browser environment only. Defaults to false.
type HttpOptionsType =
    { proxy :: NullOrUndefined String
    , connectTimeout :: NullOrUndefined Int
    , timeout :: NullOrUndefined Int
    , xhrAsync :: NullOrUndefined Boolean
    , xhrWithCredentials :: NullOrUndefined Boolean
    }

newtype HttpOptions = HttpOptions HttpOptionsType
derive instance newtypeHttpOptions :: Newtype HttpOptions _
derive instance repGenericHttpOptions :: Generic HttpOptions _
instance showHttpOptions :: Show HttpOptions where show = genericShow
instance encodeHttpOptions :: Encode HttpOptions where encode = genericEncode

defaultHttpOptions :: HttpOptions
defaultHttpOptions = HttpOptions
    { proxy: NullOrUndefined Nothing
    , connectTimeout: NullOrUndefined Nothing
    , timeout: NullOrUndefined Nothing
    , xhrAsync: NullOrUndefined Nothing
    , xhrWithCredentials: NullOrUndefined Nothing
    }

defaultHttpOptions' :: (HttpOptionsType -> HttpOptionsType) -> HttpOptions
defaultHttpOptions' f = over HttpOptions f defaultHttpOptions

newtype Service = Service Foreign
newtype ServiceName = ServiceName String

foreign import serviceImpl :: forall eff. String -> Foreign -> Eff (exception :: EXCEPTION | eff) Foreign
service :: forall eff. ServiceName -> Options -> Eff (exception :: EXCEPTION | eff) Service
service (ServiceName name) options = do
    f <- serviceImpl name $ encode options
    pure $ Service f
