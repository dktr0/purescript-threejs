module ThreeJS where

import Prelude
import Effect (Effect)
import Web.HTML.HTMLMediaElement as HTML

-- Scene

foreign import data Scene :: Type

foreign import newScene :: Effect Scene


-- PerspectiveCamera

foreign import data PerspectiveCamera :: Type

foreign import newPerspectiveCamera :: Number -> Number -> Number -> Number -> Effect PerspectiveCamera

foreign import setAspect :: PerspectiveCamera -> Number -> Effect Unit


-- Renderer

foreign import data Renderer :: Type

foreign import newWebGLRenderer :: forall p. Record p -> Effect Renderer

foreign import render :: Renderer -> Scene -> PerspectiveCamera -> Effect Unit

foreign import setSize :: Renderer -> Number -> Number -> Boolean -> Effect Unit

foreign import renderListsDispose :: Renderer -> Effect Unit


-- Mesh

foreign import data Mesh :: Type

foreign import newMesh :: forall a b. a -> b -> Effect Mesh

foreign import setReceiveShadow :: Mesh -> Boolean -> Effect Unit



-- 3D object Loaders

-- Loading GLTF resources via GLTFLoader

foreign import data AnimationClip :: Type

type GLTF = {
  animations :: Array AnimationClip, -- in ThreeJS: Array<THREE.AnimationClip>
  scene :: Scene, -- in ThreeJS: THREE.Group
  scenes :: Array Scene, -- in ThreeJS: Array<THREE.Group>
  -- cameras :: Array Camera,
  asset :: Mesh -- ? in ThreeJS: Object
  }

foreign import data GLTFLoader :: Type

foreign import loadGLTF :: String -> (GLTF -> Effect Unit) -> Effect GLTFLoader

foreign import loadGLTF1 :: GLTFLoader -> String -> (GLTF -> Effect Unit) -> Effect Unit

loadGLTF_DRACO :: String -> String -> (GLTF -> Effect Unit) -> Effect GLTFLoader
loadGLTF_DRACO pathToDracoModules url cb = do
  gltfLoader <- newGLTFLoader
  dracoLoader <- newDRACOLoader
  setDecoderPath dracoLoader pathToDracoModules
  setDRACOLoader gltfLoader dracoLoader
  loadGLTF1 gltfLoader url cb
  pure gltfLoader

foreign import newGLTFLoader :: Effect GLTFLoader

foreign import data DRACOLoader :: Type

foreign import newDRACOLoader :: Effect DRACOLoader

foreign import setDecoderPath :: DRACOLoader -> String -> Effect Unit

foreign import setDRACOLoader :: GLTFLoader -> DRACOLoader -> Effect Unit

foreign import data MTL :: Type

foreign import loadMTL :: String -> (MTL -> Effect Unit) -> Effect MTL

foreign import data OBJ :: Type

foreign import loadOBJ :: String -> (OBJ -> Effect Unit) -> Effect OBJ

-------------

foreign import data Group :: Type

foreign import newGroup :: Effect Group

-------------

foreign import data PlaneGeometry :: Type

foreign import newPlaneGeometry :: Number -> Number -> Int -> Int -> Effect PlaneGeometry


-------------

foreign import data MeshPhongMaterial :: Type

foreign import newMeshPhongMaterial :: forall params. Record params -> Effect MeshPhongMaterial



-------------

foreign import setColorInt :: forall a. a -> Int -> Effect Unit

foreign import addAnything :: forall a b. a -> b -> Effect Unit

foreign import addAnythingToScene :: forall a. Scene -> a -> Effect Unit

foreign import cloneObject3D :: forall a b. a -> Boolean -> Effect b -- yikes!!!

foreign import copyObject3D :: forall a b. a -> b -> Boolean -> Effect Unit

foreign import removeObject3D :: forall a b. a -> b -> Effect Unit

foreign import removeFromParent :: forall a. a -> Effect Unit

foreign import setPositionOfAnything :: forall a. a -> Number -> Number -> Number -> Effect Unit

-- foreign import getPositionOfAnything :: forall a. a -> Effect Vector3

foreign import setPositionX :: forall a. a -> Number -> Effect Unit

foreign import setPositionY :: forall a. a -> Number -> Effect Unit

foreign import setPositionZ :: forall a. a -> Number -> Effect Unit

foreign import rotationX :: forall a. a -> Effect Number

foreign import rotationY :: forall a. a -> Effect Number

foreign import rotationZ :: forall a. a -> Effect Number

setRotationX :: forall a. a -> Number -> Effect Unit
setRotationX o x = do
  y <- rotationY o
  z <- rotationZ o
  setRotationOfAnything o x y z

setRotationY :: forall a. a -> Number -> Effect Unit
setRotationY o y = do
  x <- rotationX o
  z <- rotationZ o
  setRotationOfAnything o x y z

setRotationZ :: forall a. a -> Number -> Effect Unit
setRotationZ o z = do
  x <- rotationX o
  y <- rotationY o
  setRotationOfAnything o x y z

foreign import setRotationOfAnything :: forall a. a -> Number -> Number -> Number -> Effect Unit

foreign import setScaleOfAnything :: forall a. a -> Number -> Number -> Number -> Effect Unit

foreign import setRepeatOfAnything :: forall a. a -> Number -> Number -> Effect Unit

foreign import preloadAnything :: forall o. o -> Effect Unit

foreign import playAnything :: forall o. o -> Effect Unit

foreign import printAnything :: forall o. o -> Effect Unit

------------ LIGHTS

foreign import data HemisphereLight :: Type

foreign import newHemisphereLight :: Int -> Int -> Number -> Effect HemisphereLight

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

foreign import setDuration :: AnimationAction -> Number -> Effect Unit

foreign import setEffectiveWeight :: AnimationAction -> Number -> Effect Unit

foreign import crossFadeFrom :: AnimationAction -> AnimationAction -> Number -> Boolean -> Effect Unit

foreign import crossFadeTo :: AnimationAction -> AnimationAction -> Number -> Boolean -> Effect Unit

foreign import fadeIn :: AnimationAction -> Number -> Effect Unit

foreign import fadeOut :: AnimationAction -> Number -> Effect Unit

foreign import stop :: AnimationAction -> Effect Unit


------------ GEOMETRIES

foreign import data Geometry :: Type

foreign import newBoxGeometry :: Number -> Number -> Number -> Effect Geometry

------------ MATERIALS

foreign import data Material :: Type

foreign import meshBasicMaterial :: forall p. Record p -> Effect Material

-- TEXTURE

--loading

foreign import data TextureLoader :: Type

foreign import textureLoader :: String -> Effect TextureLoader

foreign import createElement :: String -> Effect HTML.HTMLMediaElement

foreign import getElementById :: String -> Effect HTML.HTMLMediaElement

foreign import videoTexture :: HTML.HTMLMediaElement -> Effect TextureLoader

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

--

foreign import requestAnimationFrame :: Effect Unit -> Effect Unit
