module ThreeJS where

import Prelude
import Effect (Effect)

-- Scene

foreign import data Scene :: Type

foreign import newScene :: Effect Scene


-- PerspectiveCamera

foreign import data PerspectiveCamera :: Type

foreign import newPerspectiveCamera :: Number -> Number -> Number -> Number -> Effect PerspectiveCamera

foreign import setAspect :: PerspectiveCamera -> Number -> Effect Unit

-- OrthographicCamera

foreign import data OrthographicCamera :: Type

foreign import newOrthographicCamera :: Number -> Number -> Number -> Number -> Number -> Number -> Effect OrthographicCamera



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

foreign import loadOBJ :: String -> (OBJ -> Effect Unit) -> Effect Unit

-------------

foreign import data Group :: Type

foreign import newGroup :: Effect Group

-------------

-- Geometries

foreign import data PlaneGeometry :: Type

foreign import newPlaneGeometry :: Number -> Number -> Int -> Int -> Effect PlaneGeometry

foreign import data CapsuleGeometry :: Type

foreign import newCapsuleGeometry :: Number -> Number -> Int -> Int -> Effect CapsuleGeometry

foreign import data SphereGeometry :: Type

foreign import newSphereGeometry :: Number -> Int -> Int -> Number -> Number -> Number -> Number -> Effect SphereGeometry

foreign import data TetrahedronGeometry :: Type

foreign import newTetrahedronGeometry :: Number -> Int -> Effect TetrahedronGeometry

foreign import data CircleGeometry :: Type

foreign import newCircleGeometry :: Number -> Int -> Number -> Number -> Effect CircleGeometry

foreign import data ConeGeometry :: Type

foreign import newConeGeometry :: Number -> Number -> Int -> Int -> Boolean -> Number -> Number -> Effect ConeGeometry

foreign import data CylinderGeometry :: Type

foreign import newCylinderGeometry :: Number -> Number -> Number -> Int -> Int -> Boolean -> Number -> Number -> Effect CylinderGeometry

foreign import data DodecahedronGeometry :: Type

foreign import newDodecahedronGeometry :: Number -> Int -> Effect DodecahedronGeometry

foreign import data TorusGeometry :: Type

foreign import newTorusGeometry :: Number -> Number -> Int -> Int -> Number -> Effect TorusGeometry

foreign import data TorusKnotGeometry :: Type

foreign import newTorusKnotGeometry :: Number -> Number -> Int -> Int -> Int -> Int -> Effect TorusKnotGeometry

foreign import data WireframeGeometry :: Type

foreign import newWireframeGeometry :: forall a. a -> Effect WireframeGeometry

foreign import data RingGeometry :: Type

foreign import newRingGeometry :: Number -> Number -> Int -> Int -> Number -> Number -> Effect RingGeometry

foreign import data OctahedronGeometry :: Type

foreign import newOctahedronGeometry :: Number -> Int -> Effect OctahedronGeometry

foreign import data IcosahedronGeometry :: Type

foreign import newIcosahedronGeometry :: Number -> Int -> Effect IcosahedronGeometry

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

-- HELPERS

foreign import data PolarGridHelper :: Type

foreign import newPolarGridHelper :: Number -> Int -> Int -> Int -> Effect PolarGridHelper

foreign import data GridHelper :: Type

foreign import newGridHelper :: Number -> Number -> Effect GridHelper

foreign import data AxesHelper :: Type

foreign import newAxesHelper :: Number -> Effect AxesHelper

foreign import data BoxHelper :: Type

foreign import newBoxHelper :: forall a. a -> Int -> Effect BoxHelper

foreign import data Box3Helper :: Type

foreign import newBox3Helper :: Box3 -> Int -> Effect Box3Helper

foreign import data CameraHelper :: Type

foreign import newCameraHelper :: forall a. a -> Effect CameraHelper

foreign import data PlaneHelper :: Type

foreign import newPlaneHelper :: forall a. a -> Number -> Int -> Effect PlaneHelper

foreign import data DirectionalLightHelper :: Type

foreign import newDirectionalLightHelper :: DirectionalLight -> Number -> Int -> Effect DirectionalLightHelper

foreign import data HemisphereLightHelper :: Type

foreign import newHemisphereLightHelper :: HemisphereLight -> Number -> Int -> Effect HemisphereLightHelper

foreign import data PointLightHelper :: Type

foreign import newPointLightHelper :: PointLight -> Number -> Int -> Effect PointLightHelper

foreign import data SpotLightHelper :: Type

foreign import newSpotLightHelper :: SpotLight -> Int -> Effect SpotLightHelper


-- MATH

foreign import data Vector2 :: Type

foreign import newVector2 :: Number -> Number -> Effect Vector2

foreign import data Vector3 :: Type

foreign import newVector3 :: Number -> Number -> Number -> Effect Vector3

foreign import data Box3 :: Type

foreign import newBox3 :: Vector3 -> Vector3 -> Effect Box3

foreign import data Plane :: Type

foreign import newPlane :: Vector3 -> Number -> Effect Plane

--

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

------------ OBJECTS

foreign import data Sprite :: Type

foreign import newSprite :: SpriteMaterial -> Effect Sprite

foreign import data Points :: Type

foreign import newPoints :: forall a b. a -> b -> Effect Points

foreign import data Line :: Type

foreign import newLine :: forall a b. a -> b -> Effect Line

------------ MATERIALS

foreign import data Material :: Type

foreign import meshBasicMaterial :: forall p. Record p -> Effect Material

foreign import data MeshStandardMaterial :: Type

foreign import newMeshStandardMaterial :: forall params. Record params -> Effect MeshStandardMaterial

foreign import data SpriteMaterial :: Type

foreign import newSpriteMaterial :: forall params. Record params -> Effect SpriteMaterial

foreign import data ShadowMaterial :: Type

foreign import shadowMaterial :: forall params. Record params -> Effect ShadowMaterial

foreign import data ShaderMaterial :: Type

foreign import shaderMaterial :: forall params. Record params -> Effect ShaderMaterial

foreign import data RawShaderMaterial :: Type

foreign import rawShaderMaterial :: forall params. Record params -> Effect RawShaderMaterial

foreign import data MeshToonMaterial :: Type

foreign import meshToonMaterial :: forall params. Record params -> Effect MeshToonMaterial

foreign import data MeshPhysicalMaterial :: Type

foreign import meshPhysicalMaterial :: forall params. Record params -> Effect MeshPhysicalMaterial

foreign import data MeshNormalMaterial :: Type

foreign import meshNormalMaterial :: forall params. Record params -> Effect MeshNormalMaterial

foreign import data MeshMatcapMaterial :: Type

foreign import meshMatcapMaterial :: forall params. Record params -> Effect MeshMatcapMaterial

foreign import data MeshLambertMaterial :: Type

foreign import meshLambertMaterial :: forall params. Record params -> Effect MeshLambertMaterial

foreign import data MeshDistanceMaterial :: Type

foreign import meshDistanceMaterial :: forall params. Record params -> Effect MeshDistanceMaterial

foreign import data MeshDepthMaterial :: Type

foreign import meshDepthMaterial :: forall params. Record params -> Effect MeshDepthMaterial

foreign import data LineDashedMaterial :: Type

foreign import lineDashedMaterial :: forall params. Record params -> Effect LineDashedMaterial

foreign import data LineBasicMaterial :: Type

foreign import lineBasicMaterial :: forall params. Record params -> Effect LineBasicMaterial

foreign import data PointsMaterial :: Type

foreign import pointsMaterial :: forall params. Record params -> Effect PointsMaterial

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

foreign import loop :: ElementLoader -> Boolean -> Effect Unit

foreign import muted :: ElementLoader -> Boolean -> Effect Unit

foreign import volume :: ElementLoader -> Number -> Effect Unit

foreign import autoplay :: ElementLoader -> Boolean -> Effect Unit

foreign import requestAnimationFrame :: Effect Unit -> Effect Unit
