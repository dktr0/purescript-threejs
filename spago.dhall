{ name = "purescript-threejs"
, dependencies = [ "easy-ffi", "effect", "prelude", "purescript-three" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
