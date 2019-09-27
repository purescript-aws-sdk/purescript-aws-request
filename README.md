# purescript-aws-request

[![Build Status](https://app.wercker.com/status/5909b9e96d1080804b17a28f72f87b6b/s/master)](https://app.wercker.com/project/byKey/5909b9e96d1080804b17a28f72f87b6b)

## Getting started

```sh
bower install purescript-aws-request
npm install aws-sdk # bower package doesn't work :(
```

## Documentation

Module documentation is [published on GitHub](https://github.com/purescript-aws-sdk/purescript-aws-request/tree/master/docs).

## Warning: Missing service options

AWS services can be created with a set of options. Most of those are currently supported, but a handful are missing.

- `sessionToken` is missing
- `credentials` is missing
- `credentialProvider` is missing
- `logger` is missing
- `apiVersions` is missing

- `paramValidation` can't be a `Boolean`
- `apiVersion` can't be a `Date`

- `retryDelayOptions` is missing the `customBackoff` property
- `httpOptions` is missing the `agent` property
