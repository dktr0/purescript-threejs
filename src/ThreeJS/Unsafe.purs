module ThreeJS.Unsafe where

import Prelude
import Effect (Effect)
import Web.HTML as HTML

-- for class Object3D

foreign import lookAt :: forall a. a -> Number -> Number -> Number -> Effect Unit

foreign import setPosition :: forall a. a -> Number -> Number -> Number -> Effect Unit

foreign import setPositionX :: forall a. a -> Number -> Effect Unit

foreign import setPositionY :: forall a. a -> Number -> Effect Unit

foreign import setPositionZ :: forall a. a -> Number -> Effect Unit

foreign import getRotationX :: forall a. a -> Effect Number

foreign import getRotationY :: forall a. a -> Effect Number

foreign import getRotationZ :: forall a. a -> Effect Number

foreign import setRotation :: forall a. a -> Number -> Number -> Number -> Effect Unit

foreign import setRotationX :: forall a. a -> Number -> Effect Unit

foreign import setRotationY :: forall a. a -> Number -> Effect Unit

foreign import setRotationZ :: forall a. a -> Number -> Effect Unit


-- for class Light

foreign import getLightColor :: forall a. a -> Effect Int

foreign import setLightColor :: forall a. a -> Int -> Effect Unit

foreign import getLightIntensity :: forall a. a -> Effect Number

foreign import setLightIntensity :: forall a. a -> Number -> Effect Unit


-- for class SetDistance

foreign import setDistance :: forall a. a -> Number -> Effect Unit

-- for class SetDecay

foreign import setDecay :: forall a. a -> Number -> Effect Unit
