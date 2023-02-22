module ThreeJS.Unsafe where

import Prelude
import Effect (Effect)
import Web.HTML.HTMLMediaElement as HTML

foreign import lookAt :: forall a. a -> Number -> Number -> Number -> Effect Unit

foreign import setPosition :: forall a. a -> Number -> Number -> Number -> Effect Unit

foreign import setPositionX :: forall a. a -> Number -> Effect Unit

foreign import setPositionY :: forall a. a -> Number -> Effect Unit

foreign import setPositionZ :: forall a. a -> Number -> Effect Unit
