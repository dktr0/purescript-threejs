module ThreeJS where

-- This module contains extra PureScript bindings for ThreeJS things.

import Prelude
import Effect (Effect)
import Graphics.Three.Scene as Scene
import Graphics.Three.Camera as Camera
import Graphics.Three.Object3D as Object3D

import Data.Foreign.EasyFFI (unsafeForeignProcedure, unsafeForeignFunction)

-- import Graphics.Three.Renderer as Renderer
-- import Graphics.Three.Geometry as Geometry
-- import Graphics.Three.Material as Material

-- Loading GLTF resources via GLTFLoader

foreign import data AnimationClip :: Type

type GLTF = {
  animations :: Array AnimationClip, -- in ThreeJS: Array<THREE.AnimationClip>
  scene :: Scene.Scene, -- in ThreeJS: THREE.Group
  scenes :: Array Scene.Scene, -- in ThreeJS: Array<THREE.Group>
  -- cameras :: Array Camera.Camera,
  asset :: Object3D.Mesh -- ? -- in ThreeJS: Object
  }

foreign import loadGLTF :: String -> (GLTF -> Effect Unit) -> Effect Unit

-- hacky, but... for now...
foreign import addAnythingToScene :: forall a. Scene.Scene -> a -> Effect Unit

-- hacky, but... for now...
foreign import setPositionOfAnything :: forall a. a -> Number -> Number -> Number -> Effect Unit

foreign import setRotationOfAnything :: forall a. a -> Number -> Number -> Number -> Effect Unit

foreign import data HemisphereLight :: Type

foreign import newHemisphereLight :: Int -> Int -> Number -> Effect HemisphereLight

foreign import data AmbientLight :: Type

foreign import newAmbientLight :: Int -> Number -> Effect AmbientLight

foreign import data DirectionalLight :: Type

foreign import newDirectionalLight :: Int -> Number -> Effect DirectionalLight

foreign import data PointLight :: Type

foreign import newPointLight :: Int -> Number -> Number -> Number -> Effect PointLight

foreign import data PolarGridHelper :: Type

foreign import newPolarGridHelper :: Number -> Int -> Int -> Int -> Effect PolarGridHelper

foreign import windowInnerWidth :: Effect Number

foreign import windowInnerHeight :: Effect Number

foreign import data AnimationMixer :: Type

foreign import newAnimationMixer :: forall o. o -> Effect AnimationMixer

foreign import updateAnimationMixer :: AnimationMixer -> Number -> Effect Unit

foreign import data AnimationAction :: Type

foreign import clipAction :: AnimationMixer -> AnimationClip -> Effect AnimationAction

foreign import setEffectiveTimeScale :: AnimationAction -> Number -> Effect Unit

foreign import play :: forall o. o -> Effect Unit

-----------------------------
-----------------------------
-- EasyFFI

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
