module AWS.Service where

import Prelude (bind, pure, ($))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Foreign (Foreign)
import Data.Maybe (Maybe(..))
import Data.StrMap (StrMap)
import Simple.JSON (write)

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
type Options =
    { params :: Maybe (StrMap String)
    , endpoint :: Maybe String
    , accessKeyId :: Maybe String
    , secretAccessKey :: Maybe String
    , region :: Maybe String
    , maxRetries :: Maybe Int
    , maxRedirects :: Maybe Int
    , sslEnabled :: Maybe Boolean
    , paramValidation :: Maybe ParamValidation
    , computeChecksums :: Maybe Boolean
    , convertResponseTypes :: Maybe Boolean
    , correctClockSkew :: Maybe Boolean
    , s3ForcePathStyle :: Maybe Boolean
    , s3BucketEndpoint :: Maybe Boolean
    , s3DisableBodySigning :: Maybe Boolean
    , retryDelayOptions :: Maybe RetryDelayOptions
    , httpOptions :: Maybe HttpOptions
    , apiVersion :: Maybe String
    , apiVersions :: Maybe (StrMap String)
    , systemClockOffset :: Maybe Int
    , signatureVersion :: Maybe String
    , signatureCache :: Maybe Boolean
    , dynamoDbCrc32 :: Maybe Boolean
    }

options :: Options
options =
    { params: Nothing
    , endpoint: Nothing
    , accessKeyId: Nothing
    , secretAccessKey: Nothing
    , region: Nothing
    , maxRetries: Nothing
    , maxRedirects: Nothing
    , sslEnabled: Nothing
    , paramValidation: Nothing
    , computeChecksums: Nothing
    , convertResponseTypes: Nothing
    , correctClockSkew: Nothing
    , s3ForcePathStyle: Nothing
    , s3BucketEndpoint: Nothing
    , s3DisableBodySigning: Nothing
    , retryDelayOptions: Nothing
    , httpOptions: Nothing
    , apiVersion: Nothing
    , apiVersions: Nothing
    , systemClockOffset: Nothing
    , signatureVersion: Nothing
    , signatureCache: Nothing
    , dynamoDbCrc32: Nothing
    }

-- Whether input parameters should be validated against the operation description before sending the request.
--   - min [Boolean] — Validates that a value meets the min constraint. This is enabled by default when paramValidation is set to true.
--   - max [Boolean] — Validates that a value meets the max constraint.
--   - pattern [Boolean] — Validates that a string value matches a regular expression.
--   - enum [Boolean] — Validates that a string value matches one of the allowable enum values.
type ParamValidation =
    { min :: Maybe Boolean
    , max :: Maybe Boolean
    , pattern :: Maybe Boolean
    , enum :: Maybe Boolean
    }

paramValidation :: ParamValidation
paramValidation =
    { min: Nothing
    , max: Nothing
    , pattern: Nothing
    , enum: Nothing
    }

-- A set of options to configure the retry delay on retryable errors.
--   - base [Integer] — The base number of milliseconds to use in the exponential backoff for operation retries. Defaults to 100 ms for all services except DynamoDB, where it defaults to 50ms.
--   - customBackoff [function] — A custom function that accepts a retry count and returns the amount of time to delay in milliseconds. The base option will be ignored if this option is supplied.
type RetryDelayOptions =
    { base :: Maybe Int
    }

retryDelayOptions :: RetryDelayOptions
retryDelayOptions =
    { base: Nothing
    }

-- A set of options to pass to the low-level HTTP request.
--   - proxy [String] — the URL to proxy requests through
--   - agent [http.Agent, https.Agent] — the Agent object to perform HTTP requests with. Used for connection pooling. Defaults to the global agent (http.globalAgent) for non-SSL connections. Note that for SSL connections, a special Agent object is used in order to enable peer certificate verification. This feature is only available in the Node.js environment.
--   - connectTimeout [Int] — Sets the socket to timeout after failing to establish a connection with the server after connectTimeout milliseconds. This timeout has no effect once a socket connection has been established.
--   - timeout [Int] — Sets the socket to timeout after timeout milliseconds of inactivity on the socket. Defaults to two minutes (120000).
--   - xhrAsync [Boolean] — Whether the SDK will send asynchronous HTTP requests. Used in the browser environment only. Set to false to send requests synchronously. Defaults to true (async on).
--   - xhrWithCredentials [Boolean] — Sets the "withCredentials" property of an XMLHttpRequest object. Used in the browser environment only. Defaults to false.
type HttpOptions =
    { proxy :: Maybe String
    , connectTimeout :: Maybe Int
    , timeout :: Maybe Int
    , xhrAsync :: Maybe Boolean
    , xhrWithCredentials :: Maybe Boolean
    }

httpOptions :: HttpOptions
httpOptions =
    { proxy: Nothing
    , connectTimeout: Nothing
    , timeout: Nothing
    , xhrAsync: Nothing
    , xhrWithCredentials: Nothing
    }

type Service = Foreign
type ServiceName = String

foreign import serviceImpl :: forall eff. String -> Foreign -> Eff (exception :: EXCEPTION | eff) Foreign
service :: forall eff. ServiceName -> Options -> Eff (exception :: EXCEPTION | eff) Service
service serviceName options' = do
    f <- serviceImpl serviceName $ write options'
    pure $ f
