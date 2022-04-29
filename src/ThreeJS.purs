module ThreeJS where

-- This module contains extra PureScript bindings for ThreeJS things.

import Prelude
import Effect (Effect)
import Graphics.Three.Scene as Scene
import Graphics.Three.Camera as Camera
import Graphics.Three.Object3D as Object3D

-- import Graphics.Three.Renderer as Renderer
-- import Graphics.Three.Geometry as Geometry
-- import Graphics.Three.Material as Material

-- 3D object Loaders

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

foreign import data MTL :: Type

foreign import loadMTL :: String -> (MTL -> Effect Unit) -> Effect Unit

foreign import data OBJ :: Type

instance object3DOBJ :: Object3D.Object3D OBJ

foreign import loadOBJ :: String -> (OBJ -> Effect Unit) -> Effect Unit

-------------

-- hacky, but... for now...
foreign import addAnythingToScene :: forall a. Scene.Scene -> a -> Effect Unit

-- hacky, but... for now...
foreign import setPositionOfAnything :: forall a. a -> Number -> Number -> Number -> Effect Unit

foreign import setRotationOfAnything :: forall a. a -> Number -> Number -> Number -> Effect Unit

foreign import setScaleOfAnything :: forall a. a -> Number -> Number -> Number -> Effect Unit

foreign import setRepeatOfAnything :: forall a. a -> Number -> Number -> Effect Unit

foreign import preloadAnything :: forall o. o -> Effect Unit

------------ LIGHTS

foreign import data HemisphereLight :: Type

foreign import hemisphereLight :: Int -> Int -> Int -> Effect HemisphereLight

foreign import data AmbientLight :: Type

foreign import newAmbientLight :: Int -> Number -> Effect AmbientLight

foreign import data DirectionalLight :: Type

foreign import newDirectionalLight :: Int -> Number -> Effect DirectionalLight

foreign import data PointLight :: Type

foreign import newPointLight :: Int -> Number -> Number -> Number -> Effect PointLight

--

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

foreign import print :: forall o. o -> Effect Unit

foreign import requestAnimationFrame :: Effect Unit -> Effect Unit

-- TEXTURE

--loading

foreign import data TextureLoader :: Type

foreign import textureLoader :: String -> Effect TextureLoader

foreign import data ElementLoader :: Type

foreign import createElement :: String -> Effect ElementLoader

foreign import srcOfElement :: ElementLoader -> String -> Effect Unit

foreign import getElementById :: String -> Effect ElementLoader

foreign import videoTexture :: ElementLoader -> Effect TextureLoader

--changing

foreign import data Wrapping :: Type

foreign import clampToEdgeWrapping :: Effect Wrapping

foreign import repeatWrapping :: Effect Wrapping

foreign import mirroredRepeatWrapping :: Effect Wrapping

foreign import wrapS :: TextureLoader -> Effect Wrapping -> Effect Unit

foreign import wrapT :: TextureLoader -> Effect Wrapping -> Effect Unit

foreign import data Filter :: Type

foreign import nearestFilter :: Effect Filter

foreign import linearFilter :: Effect Filter

foreign import minFilter :: TextureLoader -> Effect Filter -> Effect Unit

foreign import magFilter :: TextureLoader -> Effect Filter -> Effect Unit

--video settings

foreign import play :: ElementLoader -> Effect Unit

-- foreign import play :: ElementLoader -> Effect Unit -- keyEvent: p

foreign import loop :: ElementLoader -> Boolean -> Effect Unit

foreign import muted :: ElementLoader -> Boolean -> Effect Unit

foreign import volume :: ElementLoader -> Number -> Effect Unit

foreign import autoplay :: ElementLoader -> Boolean -> Effect Unit
