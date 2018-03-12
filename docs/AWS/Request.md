## Module AWS.Request

#### `ServiceName`

``` purescript
newtype ServiceName
  = ServiceName String
```

#### `MethodName`

``` purescript
newtype MethodName
  = MethodName String
```

#### `request`

``` purescript
request :: forall eff i o. Encode i => Decode o => ServiceName -> MethodName -> i -> Aff (exception :: EXCEPTION | eff) o
```

#### `nouJust`

``` purescript
nouJust :: forall a. a -> NullOrUndefined a
```

#### `nouNothing`

``` purescript
nouNothing :: forall a. NullOrUndefined a
```


