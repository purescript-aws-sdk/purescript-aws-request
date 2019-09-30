## Module AWS.Request

#### `MethodName`

``` purescript
newtype MethodName
  = MethodName String
```

#### `request`

``` purescript
request :: forall i o. Encode i => Decode o => Service -> MethodName -> i -> Aff o
```


