## Module AWS.Request

#### `MethodName`

``` purescript
newtype MethodName
  = MethodName String
```

#### `request`

``` purescript
request :: forall i o. WriteForeign i => ReadForeign o => Service -> MethodName -> i -> Aff o
```


