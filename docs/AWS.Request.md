## Module AWS.Request

#### `MethodName`

``` purescript
type MethodName = String
```

#### `request`

``` purescript
request :: Service -> MethodName -> Foreign -> Aff Foreign
```

#### `unsafeRequest`

``` purescript
unsafeRequest :: forall input output. Service -> MethodName -> input -> Aff output
```

Only call `unsafeRequest` for auto generated code that guarantees
that the `input` and `output` types are correct.


