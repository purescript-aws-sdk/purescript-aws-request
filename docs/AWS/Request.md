## Module AWS.Request

#### `MethodName`

``` purescript
type MethodName = String
```

#### `request`

``` purescript
request :: forall eff i o. Encode i => Decode o => Service -> MethodName -> i -> Aff (exception :: EXCEPTION | eff) o
```


