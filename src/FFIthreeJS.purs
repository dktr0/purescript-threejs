module FFIthreeJS where

import Prelude
import Effect (Effect)

import Data.Foreign.EasyFFI (unsafeForeignProcedure, unsafeForeignFunction)

-- TEXTURES / MATERIAL

foreign import data TextureLoader             :: Type
foreign import data VideoTexture              :: Type

class Texture a
instance textureTextureLoader :: Texture TextureLoader

-- Importing

textureLoader :: String -> Effect TextureLoader
textureLoader = unsafeForeignFunction ["param", ""] "new THREE.TextureLoader().load(param)"

createVideoById :: String -> Effect Unit
createVideoById = unsafeForeignFunction ["id", ""] "document.createElement(id)"

-- STILL IMPLEMENTING
-- addVideoTexture :: forall opt. {|opt} -> Effect VideoTexture
-- addVideoTexture = unsafeForeignFunction ["video", ""] "new THREE.VideoTexture(video)"

-- Wrapping modes

wrapSclampToEdge :: forall a. Texture a => a -> Effect Unit
wrapSclampToEdge = unsafeForeignFunction ["texture", ""] "texture.wrapS = THREE.ClampToEdgeWrapping;"

wrapTclampToEdge :: forall a. Texture a => a -> Effect Unit
wrapTclampToEdge = unsafeForeignFunction ["texture", ""] "texture.wrapT = THREE.ClampToEdgeWrapping;"

wrapSrepeat :: forall a. Texture a => a -> Effect Unit
wrapSrepeat = unsafeForeignFunction ["texture", ""] "texture.wrapS = THREE.RepeatWrapping;"

wrapTrepeat :: forall a. Texture a => a -> Effect Unit
wrapTrepeat = unsafeForeignFunction ["texture", ""] "texture.wrapT = THREE.RepeatWrapping;"

wrapSmirroredRepeat :: forall a. Texture a => a -> Effect Unit
wrapSmirroredRepeat = unsafeForeignFunction ["texture", ""] "texture.wrapS = THREE.MirroredRepeatWrapping;"

wrapTmirroredRepeat :: forall a. Texture a => a -> Effect Unit
wrapTmirroredRepeat = unsafeForeignFunction ["texture", ""] "texture.wrapT = THREE.MirroredRepeatWrapping;"

--

repeatSet :: forall a. Texture a => a -> Number -> Number -> Effect Unit
repeatSet = unsafeForeignProcedure ["texture", "x", "y", ""] "texture.repeat.set(x,y);"


-- GENERAL

requestAnimationFrame :: Effect Unit -> Effect Unit
requestAnimationFrame = unsafeForeignProcedure ["callback", ""] "window.requestAnimationFrame(callback)"

unsafePrint :: forall a. a -> Effect Unit
unsafePrint = unsafeForeignProcedure ["a", ""] "console.log(a)"

--------------

-- NOT SURE WHY THIS APPROACH RESULTS IN A WEIRD ERROR ON THE CONSOLE, SOMETHING WITH THREE.MIN.JS

-- foreign import data ClampToEdgeWrapping       :: Type
-- foreign import data RepeatWrapping            :: Type
-- foreign import data MirroredRepeatWrapping    :: Type

-- class Wrapping a
--
-- instance wrappingClampToEdgeWrapping :: Wrapping ClampToEdgeWrapping
-- instance wrappingRepeatWrapping :: Wrapping RepeatWrapping
-- instance wrappingMirroredRepeatWrapping :: Wrapping MirroredRepeatWrapping
--
-- clampToEdgeWrapping :: Effect ClampToEdgeWrapping
-- clampToEdgeWrapping = unsafeForeignFunction [""] "THREE.ClampToEdgeWrapping"
--
-- repeatWrapping :: Effect RepeatWrapping
-- repeatWrapping = unsafeForeignFunction [""] "THREE.RepeatWrapping"
--
-- mirroredRepeatWrapping :: Effect MirroredRepeatWrapping
-- mirroredRepeatWrapping = unsafeForeignFunction [""] "THREE.MirroredRepeatWrapping;"
--
-- wrapS :: forall a b. Texture a => Wrapping b => a -> Effect b -> Effect Unit
-- wrapS = unsafeForeignProcedure ["texture", "wrapping", ""] "texture.wrapS = wrapping;"
--
-- wrapT :: forall a b. Texture a => Wrapping b => a -> Effect b -> Effect Unit
-- wrapT = unsafeForeignProcedure ["texture", "wrapping", ""] "texture.wrapT = wrapping;"
