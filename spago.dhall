{ name = "aws-request"
, dependencies =
  [ "aff"
  , "console"
  , "datetime"
  , "effect"
  , "exceptions"
  , "foreign"
  , "foreign-object"
  , "js-date"
  , "untagged-union"
  , "prelude"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
