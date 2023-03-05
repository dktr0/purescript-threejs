module ThreeJS where

-- This module is what should be imported in most cases by users of this library.
-- When types imported from ThreeJS are to be members of PureScript classes
-- then this is implemented by (1) having un-type-safe functions in the module
-- ThreeJS.Unsafe, (2) providing definitions with class constraints in
-- this module that use the un-type-safe definitions from ThreeJS.Unsafe, and
-- finally (3) declaring the types imported from ThreeJS to be instances of the
-- PureScript class. See the class Object3D and the type Mesh below for an example.

import Prelude
import Effect (Effect)
import Web.HTML as HTML
import ThreeJS.Unsafe as Unsafe

-- Classes

class Object3D' a -- the class has a tick in the name to avoid Object3D the specific type

lookAt :: forall a. (Object3D' a) => a -> Number -> Number -> Number -> Effect Unit
lookAt = Unsafe.lookAt

setPosition :: forall a. (Object3D' a) => a -> Number -> Number -> Number -> Effect Unit
setPosition = Unsafe.setPosition

setPositionX :: forall a. (Object3D' a) => a -> Number -> Effect Unit
setPositionX = Unsafe.setPositionX

setPositionY :: forall a. (Object3D' a) => a -> Number -> Effect Unit
setPositionY = Unsafe.setPositionY

setPositionZ :: forall a. (Object3D' a) => a -> Number -> Effect Unit
setPositionZ = Unsafe.setPositionZ

getRotationX :: forall a. (Object3D' a) => a -> Effect Number
getRotationX = Unsafe.getRotationX

getRotationY :: forall a. (Object3D' a) => a -> Effect Number
getRotationY = Unsafe.getRotationY

getRotationZ :: forall a. (Object3D' a) => a -> Effect Number
getRotationZ = Unsafe.getRotationZ

setRotation :: forall a. (Object3D' a) => a -> Number -> Number -> Number -> Effect Unit
setRotation = Unsafe.setRotation

setRotationX :: forall a. (Object3D' a) => a -> Number -> Effect Unit
setRotationX = Unsafe.setRotationX

setRotationY :: forall a. (Object3D' a) => a -> Number -> Effect Unit
setRotationY = Unsafe.setRotationY

setRotationZ :: forall a. (Object3D' a) => a -> Number -> Effect Unit
setRotationZ = Unsafe.setRotationZ


class Light a

getLightColor :: forall a. (Light a) => a -> Effect Int
getLightColor = Unsafe.getLightColor

setLightColor :: forall a. (Light a) => a -> Int -> Effect Unit
setLightColor = Unsafe.setLightColor

getLightIntensity :: forall a. (Light a) => a -> Effect Number
getLightIntensity = Unsafe.getLightIntensity

setLightIntensity :: forall a. (Light a) => a -> Number -> Effect Unit
setLightIntensity = Unsafe.setLightIntensity


class SetDistance a

setDistance :: forall a. SetDistance a => a -> Number -> Effect Unit
setDistance = Unsafe.setDistance

class SetDecay a

setDecay :: forall a. SetDecay a => a -> Number -> Effect Unit
setDecay = Unsafe.setDecay

class SetTarget a

setTarget :: forall a. SetTarget a => forall t. Object3D' t => a -> t -> Effect Unit
setTarget = Unsafe.setTarget


-- Constant
foreign import data Constant :: Type

-- Object3D

foreign import data Object3D :: Type

instance Object3D' Object3D

foreign import newObject3D :: Effect Object3D


-- Scene

foreign import data Scene :: Type

instance Object3D' Scene

foreign import newScene :: Effect Scene

foreign import data Fog :: Type

foreign import newFog :: Int -> Number -> Number -> Effect Fog

foreign import data FogExp2 :: Type

foreign import newFogExp2 :: Int -> Number -> Effect FogExp2

-- CAMERAS
-- PerspectiveCamera

foreign import data PerspectiveCamera :: Type

instance Object3D' PerspectiveCamera

foreign import newPerspectiveCamera :: Number -> Number -> Number -> Number -> Effect PerspectiveCamera

foreign import setAspect :: PerspectiveCamera -> Number -> Effect Unit

-- OrthographicCamera

foreign import data OrthographicCamera :: Type

foreign import newOrthographicCamera :: Number -> Number -> Number -> Number -> Number -> Number -> Effect OrthographicCamera

foreign import data ArrayCamera :: Type

foreign import newArrayCamera  :: forall a. a -> Effect ArrayCamera

foreign import data CubeCamera :: Type

foreign import newCubeCamera  :: Number -> Number -> WebGLCubeRenderTarget -> Effect CubeCamera

foreign import data Camera :: Type

foreign import newCamera :: Effect Camera

foreign import data StereoCamera :: Type

foreign import newStereoCamera :: Effect StereoCamera

-- Renderer

foreign import data Renderer :: Type

foreign import newWebGLRenderer :: forall p. Record p -> Effect Renderer

foreign import render :: Renderer -> Scene -> PerspectiveCamera -> Effect Unit

foreign import setSize :: Renderer -> Number -> Number -> Boolean -> Effect Unit

foreign import setClearColor :: Renderer -> Int -> Number -> Effect Unit

foreign import renderListsDispose :: Renderer -> Effect Unit

foreign import data WebGLMultipleRenderTargets :: Type

foreign import newWebGLMultipleRenderTargets :: Number -> Number -> Number -> forall p. Record p -> Effect WebGLMultipleRenderTargets

foreign import data WebGL1Renderer :: Type

foreign import newWebGL1Renderer :: forall p. Record p -> Effect WebGL1Renderer

foreign import data WebGLRenderTarget :: Type

foreign import newWebGLRenderTarget :: Number -> Number -> forall p. Record p -> Effect WebGLRenderTarget

foreign import data WebGL3DRenderTarget :: Type

foreign import newWebGL3DRenderTarget :: Number -> Number -> Number -> Effect WebGL3DRenderTarget

foreign import data WebGLArrayRenderTarget :: Type

foreign import newWebGLArrayRenderTarget :: Number -> Number -> Number -> Effect WebGLArrayRenderTarget

foreign import data WebGLCubeRenderTarget :: Type

foreign import newWebGLCubeRenderTarget :: Number -> forall p. Record p -> Effect WebGLCubeRenderTarget

foreign import data CSS2DRenderer :: Type

foreign import newCSS2DRenderer :: forall p. Record p -> Effect CSS2DRenderer

foreign import data CSS3DRenderer :: Type

foreign import newCSS3DRenderer :: forall p. Record p -> Effect CSS3DRenderer

foreign import data SVGRenderer :: Type

foreign import newSVGRenderer :: Effect SVGRenderer



-- Mesh

foreign import data Mesh :: Type

instance Object3D' Mesh

foreign import newMesh :: forall a b. a -> b -> Effect Mesh

foreign import setReceiveShadow :: Mesh -> Boolean -> Effect Unit


-- 3D object Loaders

-- OBJ --

foreign import data OBJLoader :: Type

foreign import newOBJLoader :: Effect OBJLoader

foreign import data OBJ :: Type

foreign import loadOBJ :: OBJLoader -> String -> (OBJ -> Effect Unit) -> Effect Unit

-- MTL --

foreign import data MTLLoader :: Type

foreign import newMTLLoader :: Effect MTLLoader

foreign import data MTL :: Type

foreign import loadMTL :: MTLLoader -> String -> (MTL -> Effect Unit) -> Effect Unit


-- GLTF --

type GLTF = {
  animations :: Array AnimationClip, -- in ThreeJS: Array<THREE.AnimationClip>
  scene :: Scene, -- in ThreeJS: THREE.Group
  scenes :: Array Scene, -- in ThreeJS: Array<THREE.Group>
  -- cameras :: Array Camera,
  asset :: Mesh -- ? in ThreeJS: Object
  }

foreign import data GLTFLoader :: Type

foreign import newGLTFLoader :: Effect GLTFLoader

foreign import loadGLTF1 :: GLTFLoader -> String -> (GLTF -> Effect Unit) -> Effect Unit

-- GLTF+DRACO --

loadGLTF_DRACO :: String -> String -> (GLTF -> Effect Unit) -> Effect GLTFLoader
loadGLTF_DRACO pathToDracoModules url cb = do
  gltfLoader <- newGLTFLoader
  dracoLoader <- newDRACOLoader
  setDecoderPath dracoLoader pathToDracoModules
  setDRACOLoader gltfLoader dracoLoader
  loadGLTF1 gltfLoader url cb
  pure gltfLoader

foreign import data DRACOLoader :: Type

foreign import newDRACOLoader :: Effect DRACOLoader

foreign import setDecoderPath :: DRACOLoader -> String -> Effect Unit

foreign import setDRACOLoader :: GLTFLoader -> DRACOLoader -> Effect Unit

------------------------
-- section deprecated --
foreign import loadGLTF :: String -> (GLTF -> Effect Unit) -> Effect GLTFLoader

foreign import loadOBJ1 :: String -> (OBJ -> Effect Unit) -> Effect Unit

foreign import loadMTL1 :: String -> (MTL -> Effect Unit) -> Effect Unit
----- end of section -----
------------------------

-- Loaders
foreign import data MMDLoader :: Type

foreign import newMMDLoader :: Effect MMDLoader

foreign import data MMD :: Type

foreign import loadMMD :: MMDLoader -> String -> (MMD -> Effect Unit) -> Effect Unit

foreign import data PCDLoader :: Type

foreign import newPCDLoader :: Effect PCDLoader

foreign import data PCD :: Type

foreign import loadPCD :: PCDLoader -> String -> (PCD -> Effect Unit) -> Effect Unit

foreign import data FontLoader :: Type

foreign import newFontLoader :: Effect FontLoader

foreign import data Font :: Type

foreign import loadFont :: FontLoader -> String -> (Font -> Effect Unit) -> Effect Unit

foreign import data KTX2Loader :: Type

foreign import newKTX2Loader :: Effect KTX2Loader

foreign import data KTX2 :: Type

foreign import loadKTX2 :: KTX2Loader -> String -> (KTX2 -> Effect Unit) -> Effect Unit

foreign import data LDrawLoader :: Type

foreign import newLDrawLoader :: Effect LDrawLoader

foreign import data LDraw :: Type

foreign import loadLDraw :: LDrawLoader -> String -> (LDraw -> Effect Unit) -> Effect Unit

foreign import data PDBLoader :: Type

foreign import newPDBLoader :: Effect PDBLoader

foreign import data PDB :: Type

foreign import loadPDB :: PDBLoader -> String -> (PDB -> Effect Unit) -> Effect Unit

foreign import data PRWMLoader :: Type

foreign import newPRWMLoader :: Effect PRWMLoader

foreign import data PRWM :: Type

foreign import loadPRWM :: PRWMLoader -> String -> (PRWM -> Effect Unit) -> Effect Unit

foreign import data SVGLoader :: Type

foreign import newSVGLoader :: Effect SVGLoader

foreign import data SVG :: Type

foreign import loadSVG :: SVGLoader -> String -> (SVG -> Effect Unit) -> Effect Unit

foreign import data TGALoader :: Type

foreign import newTGALoader :: Effect TGALoader

foreign import data TGA :: Type

foreign import loadTGA :: TGALoader -> String -> (TGA -> Effect Unit) -> Effect Unit

foreign import data Rhino3dmLoader :: Type

foreign import newRhino3dmLoader :: Effect Rhino3dmLoader

foreign import data Rhino3dm :: Type

foreign import loadRhino3dm :: Rhino3dmLoader -> String -> (Rhino3dm -> Effect Unit) -> Effect Unit

foreign import data AnimationLoader :: Type

foreign import newAnimationLoader :: Effect AnimationLoader

foreign import data Animation :: Type

foreign import loadAnimation :: AnimationLoader -> String -> (Animation -> Effect Unit) -> Effect Unit

foreign import data AudioLoader :: Type

foreign import newAudioLoader :: Effect AudioLoader

foreign import data AudioL :: Type

foreign import loadAudio :: AudioLoader -> String -> (AudioL -> Effect Unit) -> Effect Unit

foreign import data BufferGeometryLoader :: Type

foreign import newBufferGeometryLoader :: Effect BufferGeometryLoader

foreign import data BufferGeometryL :: Type

foreign import loadBufferGeometry :: BufferGeometryLoader -> String -> (BufferGeometryL -> Effect Unit) -> Effect Unit

foreign import data CompressedTextureLoader :: Type

foreign import newCompressedTextureLoader :: Effect CompressedTextureLoader

foreign import data CompressedTextureL :: Type

foreign import loadCompressedTexture :: CompressedTextureLoader -> String -> (CompressedTextureL -> Effect Unit) -> Effect Unit

foreign import data CubeTextureLoader :: Type

foreign import newCubeTextureLoader :: Effect CubeTextureLoader

foreign import data CubeTexture :: Type

foreign import loadCubeTexture :: CubeTextureLoader -> String -> (CubeTexture -> Effect Unit) -> Effect Unit

foreign import data DataTextureLoader :: Type

foreign import newDataTextureLoader :: Effect DataTextureLoader

foreign import data DataTexture :: Type

foreign import loadDataTexture :: DataTextureLoader -> String -> (DataTexture -> Effect Unit) -> Effect Unit

foreign import data FileLoader :: Type

foreign import newFileLoader :: Effect FileLoader

foreign import data File :: Type

foreign import loadFile :: FileLoader -> String -> (File -> Effect Unit) -> Effect Unit

foreign import data ImageBitmapLoader :: Type

foreign import newImageBitmapLoader :: Effect ImageBitmapLoader

foreign import data ImageBitmap :: Type

foreign import loadImageBitmap :: ImageBitmapLoader -> String -> (ImageBitmap -> Effect Unit) -> Effect Unit

foreign import data ImageLoader :: Type

foreign import newImageLoader :: Effect ImageLoader

foreign import data Image :: Type

foreign import loadImage :: ImageLoader -> String -> (Image -> Effect Unit) -> Effect Unit

foreign import data Loader :: Type

foreign import newLoader :: Effect Loader

foreign import data Load :: Type

foreign import loadLoader :: Loader -> String -> (Load -> Effect Unit) -> Effect Unit

foreign import data MaterialLoader :: Type

foreign import newMaterialLoader :: Effect MaterialLoader

foreign import data MaterialL :: Type

foreign import loadMaterial :: MaterialLoader -> String -> (MaterialL-> Effect Unit) -> Effect Unit

foreign import data ObjectLoader :: Type

foreign import newObjectLoader :: Effect ObjectLoader

-- foreign import data Object :: Type

-- foreign import loadObject :: ObjectLoader -> String -> (Object-> Effect Unit) -> Effect Unit


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

foreign import data TextGeometry :: Type

foreign import newTextGeometry :: String -> forall p. Record p -> Effect TextGeometry

foreign import data ExtrudeGeometry :: Type

foreign import newExtrudeGeometry :: forall a b. a -> Record b -> Effect ExtrudeGeometry

foreign import data LatheGeometry :: Type

foreign import newLatheGeometry :: forall a. a -> Int -> Number -> Number -> Effect LatheGeometry

foreign import data PolyhedronGeometry :: Type

foreign import newPolyhedronGeometry :: forall a b. a -> b -> Number -> Int -> Effect PolyhedronGeometry

foreign import data ShapeGeometry :: Type

foreign import newShapeGeometry :: forall a. a -> Int -> Effect ShapeGeometry

foreign import data ConvexGeometry :: Type

foreign import newConvexGeometry :: forall a. a -> Effect ConvexGeometry

foreign import data TubeGeometry :: Type

foreign import newTubeGeometry :: Curve -> Int -> Number -> Int -> Boolean -> Effect TubeGeometry

foreign import data EdgesGeometry :: Type

foreign import newEdgesGeometry :: forall a. a -> Effect EdgesGeometry

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

foreign import setScaleOfAnything :: forall a. a -> Number -> Number -> Number -> Effect Unit

foreign import setRepeatOfAnything :: forall a. a -> Number -> Number -> Effect Unit

foreign import preloadAnything :: forall o. o -> Effect Unit

foreign import playAnything :: forall o. o -> Effect Unit

foreign import printAnything :: forall o. o -> Effect Unit


------------ LIGHTS

foreign import data HemisphereLight :: Type
instance Object3D' HemisphereLight
instance Light HemisphereLight
foreign import newHemisphereLight :: Int -> Int -> Number -> Effect HemisphereLight
foreign import setGroundColor :: HemisphereLight -> Int -> Effect Unit

foreign import data AmbientLight :: Type
instance Object3D' AmbientLight
instance Light AmbientLight
foreign import newAmbientLight :: Int -> Number -> Effect AmbientLight

foreign import data DirectionalLight :: Type
instance Object3D' DirectionalLight
instance Light DirectionalLight
foreign import newDirectionalLight :: Int -> Number -> Effect DirectionalLight

foreign import data PointLight :: Type
instance Object3D' PointLight
instance Light PointLight
instance SetDistance PointLight
instance SetDecay PointLight
foreign import newPointLight :: Int -> Number -> Number -> Number -> Effect PointLight

foreign import data AmbientLightProbe :: Type
instance Object3D' AmbientLightProbe
instance Light AmbientLightProbe
foreign import newAmbientLightProbe :: Int -> Number -> Effect AmbientLightProbe

foreign import data RectAreaLight :: Type
instance Object3D' RectAreaLight
instance Light RectAreaLight
foreign import newRectAreaLight :: Int -> Number -> Number -> Number -> Effect RectAreaLight
foreign import setWidth :: RectAreaLight -> Number -> Effect Unit
foreign import setHeight :: RectAreaLight -> Number -> Effect Unit

foreign import data HemisphereLightProbe :: Type
instance Object3D' HemisphereLightProbe
instance Light HemisphereLightProbe
foreign import newHemisphereLightProbe :: Int -> Int -> Number -> Effect HemisphereLightProbe

foreign import data SpotLight :: Type
instance Object3D' SpotLight
instance Light SpotLight
instance SetDistance SpotLight
instance SetDecay SpotLight
foreign import newSpotLight :: Int -> Number -> Number -> Number -> Number -> Number -> Effect SpotLight
foreign import setAngle :: SpotLight -> Number -> Effect Unit
foreign import setPenumbra :: SpotLight -> Number -> Effect Unit

-- I think this should maybe be a class instead of a type also...
-- leaving it in to not break a few signatures below...
foreign import data LightProbe :: Type

foreign import newLightProbe :: SphericalHarmonics3 -> Number -> Effect LightProbe


-- LIGHTS / SHADOWS

foreign import data LightShadow :: Type

foreign import newLightShadow :: Camera -> Effect LightShadow

foreign import data PointLightShadow :: Type

foreign import newPointLightShadow :: Effect PointLightShadow

foreign import data DirectionalLightShadow :: Type

foreign import newDirectionalLightShadow :: Effect DirectionalLightShadow

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

foreign import data SkeletonHelper :: Type

-- needs to be redone in Unsafe and then referenced here since constraints can't be used directly in foreign imports
-- foreign import newSkeletonHelper :: forall a. (Object3D a) => a -> Effect SkeletonHelper

foreign import data LightProbeHelper :: Type

foreign import newLightProbeHelper :: LightProbe -> Number -> Effect LightProbeHelper

foreign import data PositionalAudioHelper :: Type

foreign import newPositionalAudioHelper :: PositionalAudio -> Number -> Effect PositionalAudioHelper

foreign import data RectAreaLightHelper :: Type

foreign import newRectAreaLightHelper :: RectAreaLight -> Int -> Effect RectAreaLightHelper

foreign import data VertexNormalsHelper :: Type

-- needs to be redone in Unsafe and then referenced here since constraints can't be used directly in foreign imports
-- foreign import newVertexNormalsHelper :: forall a. (Object3D a) => a -> Number -> Int -> Effect VertexNormalsHelper

foreign import data VertexTangentsHelper :: Type

-- needs to be redone in Unsafe and then referenced here since constraints can't be used directly in foreign imports
-- foreign import newVertexTangentsHelper :: forall a. (Object3D a) => a -> Number -> Int -> Effect VertexTangentsHelper


-- MATH

foreign import data Vector2 :: Type

foreign import newVector2 :: Number -> Number -> Effect Vector2

foreign import data Vector3 :: Type

foreign import newVector3 :: Number -> Number -> Number -> Effect Vector3

foreign import data Box3 :: Type

foreign import newBox3 :: Vector3 -> Vector3 -> Effect Box3

foreign import data Plane :: Type

foreign import newPlane :: Vector3 -> Number -> Effect Plane

foreign import data Box2 :: Type

foreign import newBox2 :: Vector2 -> Vector2 -> Effect Box2

foreign import data Cylindrical :: Type

foreign import newCylindrical :: Number -> Number -> Number -> Effect Cylindrical

foreign import data Euler :: Type

foreign import newEuler :: Number -> Number -> Number -> String -> Effect Euler

foreign import data Frustum :: Type

foreign import newFrustum :: Plane -> Plane -> Plane -> Plane -> Plane -> Plane -> Effect Frustum

foreign import data Line3 :: Type

foreign import newLine3 :: Vector3 -> Vector3 -> Effect Line3

foreign import data Quaternion :: Type

foreign import newQuaternion :: Number -> Number -> Number -> Number -> Effect Quaternion

foreign import data Ray :: Type

foreign import newRay :: Vector3 -> Vector3 -> Effect Ray

foreign import data Sphere :: Type

foreign import newSphere :: Vector3 -> Number -> Effect Sphere

foreign import data Spherical :: Type

foreign import newSpherical :: Number -> Number -> Number -> Effect Spherical

foreign import data Triangle :: Type

foreign import newTriangle :: Vector3 -> Vector3 -> Vector3 -> Effect Triangle

foreign import data Vector4 :: Type

foreign import newVector4 :: Number -> Number -> Number -> Number -> Effect Vector4

foreign import data Lut :: Type

foreign import newLut :: String -> Number -> Effect Lut

foreign import data MeshSurfaceSampler :: Type

foreign import newMeshSurfaceSampler :: Mesh -> Effect MeshSurfaceSampler

foreign import data SphericalHarmonics3 :: Type

foreign import newSphericalHarmonics3 :: Effect SphericalHarmonics3

foreign import data Matrix3 :: Type

foreign import newMatrix3 :: Effect Matrix3

foreign import data Matrix4 :: Type

foreign import newMatrix4 :: Effect Matrix4

foreign import data OBB :: Type

foreign import newOBB :: Vector3 -> Vector3 -> Matrix3 -> Effect OBB

foreign import data Color :: Type

foreign import newColor :: Int -> Effect Color

-- MATH / INTERPOLANTS
foreign import data CubicInterpolant :: Type

foreign import newCubicInterpolant :: forall a b. a -> b -> Int -> forall c. c-> Effect CubicInterpolant

foreign import data DiscreteInterpolant :: Type

foreign import newDiscreteInterpolant :: forall a b. a -> b -> Int -> forall c. c-> Effect DiscreteInterpolant

foreign import data LinearInterpolant :: Type

foreign import newLinearInterpolant :: forall a b. a -> b -> Int -> forall c. c-> Effect LinearInterpolant

foreign import data QuaternionLinearInterpolant :: Type

foreign import newQuaternionLinearInterpolant :: forall a b. a -> b -> Int -> forall c. c-> Effect QuaternionLinearInterpolant

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

foreign import data InstancedMesh :: Type

foreign import newInstancedMesh :: forall a b. a -> b -> Int -> Effect InstancedMesh

foreign import data LineLoop :: Type

foreign import newLineLoop :: forall a b. a -> b -> Effect LineLoop

foreign import data LineSegments :: Type

foreign import newLineSegments :: forall a b. a -> b -> Effect LineSegments

foreign import data SkinnedMesh :: Type

foreign import newSkinnedMesh :: forall a b. a -> b -> Effect SkinnedMesh

foreign import data Skeleton :: Type

foreign import newSkeleton :: forall a b. a -> b -> Effect Skeleton

foreign import data Bone :: Type

foreign import newBone :: Effect Bone

foreign import data LOD :: Type

foreign import newLOD :: Effect LOD

------------ MATERIALS

foreign import data MeshBasicMaterial :: Type

foreign import meshBasicMaterial :: forall p. Record p -> Effect MeshBasicMaterial

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

foreign import data Material :: Type

foreign import newMaterial :: Effect Material

-- CORE

foreign import data Clock :: Type

foreign import newClock :: Boolean -> Effect Clock

foreign import data Raycaster :: Type

foreign import newRaycaster :: Vector3 -> Vector3 -> Number -> Number -> Effect Raycaster

foreign import data Uniform :: Type

foreign import newUniform  :: forall p. Record p -> Effect Uniform

foreign import data BufferGeometry :: Type

foreign import newBufferGeometry :: Effect BufferGeometry

foreign import data EventDispatcher :: Type

foreign import newEventDispatcher :: Effect EventDispatcher

foreign import data InstancedBufferGeometry :: Type

foreign import newInstancedBufferGeometry :: Effect InstancedBufferGeometry

foreign import data Layers :: Type

foreign import newLayers :: Effect Layers



-- ANIMATION

-- foreign import data AnimationClip :: Type

type AnimationClip = {
  name :: String,
  duration :: Number
  -- note: ThreeJS type has additional fields not added here yet
  }

foreign import newAnimationClip :: String -> Number -> forall a. a -> Effect AnimationClip

foreign import data KeyframeTrack :: Type

foreign import newKeyframeTrack :: String -> forall a b. a -> b -> Constant -> Effect KeyframeTrack

-- ANIMATION / TRACKS

foreign import data BooleanKeyframeTrack :: Type

foreign import newBooleanKeyframeTrack :: String -> forall a b. a -> b -> Effect BooleanKeyframeTrack

foreign import data ColorKeyframeTrack :: Type

foreign import newColorKeyframeTrack  :: String -> forall a b. a -> b -> Effect ColorKeyframeTrack

foreign import data NumberKeyframeTrack :: Type

foreign import newNumberKeyframeTrack  :: String -> forall a b. a -> b -> Effect NumberKeyframeTrack

foreign import data QuaternionKeyframeTrack :: Type

foreign import newQuaternionKeyframeTrack  :: String -> forall a b. a -> b -> Effect QuaternionKeyframeTrack

foreign import data StringKeyframeTrack :: Type

foreign import newStringKeyframeTrack  :: String -> forall a b. a -> b -> Effect StringKeyframeTrack

foreign import data VectorKeyframeTrack :: Type

foreign import newVectorKeyframeTrack  :: String -> forall a b. a -> b -> Effect VectorKeyframeTrack

-- CORE / BUFFERATTRIBUTES

foreign import data TypedBufferAttribute :: Type

foreign import newTypedBufferAttribute  :: forall a. a -> Int -> Boolean -> Effect TypedBufferAttribute

-- EXTRAS / CORE

foreign import data Path :: Type

foreign import newPath :: forall a. a -> Effect Path

foreign import data Shape :: Type

foreign import newShape :: forall a. a -> Effect Shape

foreign import data Curve :: Type

foreign import newCurve :: Effect Curve

foreign import data CurvePath :: Type

foreign import newCurvePath :: Effect CurvePath

foreign import data ShapePath :: Type

foreign import newShapePath :: Effect ShapePath

-- EXTRAS / CURVES

foreign import data CatmullRomCurve3 :: Type

foreign import newCatmullRomCurve3 :: forall a. a -> Boolean -> String -> Number -> Effect CatmullRomCurve3

foreign import data CubicBezierCurve :: Type

foreign import newCubicBezierCurve :: Vector2 -> Vector2 -> Vector2 -> Vector2 -> Effect CubicBezierCurve

foreign import data CubicBezierCurve3 :: Type

foreign import newCubicBezierCurve3 :: Vector3 -> Vector3 -> Vector3 -> Vector3 -> Effect CubicBezierCurve3

foreign import data LineCurve :: Type

foreign import newLineCurve :: Vector2 -> Vector2 -> Effect LineCurve

foreign import data LineCurve3 :: Type

foreign import newLineCurve3 :: Vector3 -> Vector3 -> Effect LineCurve3

foreign import data QuadraticBezierCurve :: Type

foreign import newQuadraticBezierCurve :: Vector2 -> Vector2 -> Vector2 -> Effect QuadraticBezierCurve

foreign import data QuadraticBezierCurve3 :: Type

foreign import newQuadraticBezierCurve3 :: Vector3 -> Vector3 -> Vector3 -> Effect QuadraticBezierCurve3

foreign import data SplineCurve :: Type

foreign import newSplineCurve :: forall a. a -> Effect SplineCurve

foreign import data EllipseCurve :: Type

foreign import newEllipseCurve :: Number -> Number -> Number -> Number -> Number -> Number -> Boolean -> Number -> Effect EllipseCurve

-- ANIMATIONS

foreign import data CCDIKSolver :: Type

foreign import newCCDIKSolver :: SkinnedMesh -> forall a. a -> Effect CCDIKSolver

foreign import data MMDAnimationHelper :: Type

foreign import newMMDAnimationHelper :: forall params. Record params -> Effect MMDAnimationHelper

foreign import data MMDPhysics :: Type

foreign import newMMDPhysics :: SkinnedMesh -> forall a b. a -> b -> forall params. Record params -> Effect MMDPhysics

-- POST-PROCESSING

foreign import data EffectComposer :: Type

-- note: should be a class for WebGLRenderer-s but for now, just Renderer...
foreign import newEffectComposer :: Renderer -> WebGLRenderTarget -> Effect EffectComposer

-- CONVEXHULL

foreign import data VertexNode :: Type

foreign import newVertexNode :: Vector3 -> Effect VertexNode

foreign import data Face :: Type

foreign import newFace :: Effect Face

foreign import data HalfEdge :: Type

foreign import newHalfEdge :: VertexNode -> Face -> Effect HalfEdge

foreign import data ConvexHull :: Type

foreign import newConvexHull :: Effect ConvexHull

foreign import data VertexList :: Type

foreign import newVertexList :: Effect VertexList

-- AUDIO

foreign import data AudioListener :: Type

foreign import newAudioListener :: Effect AudioListener

foreign import data PositionalAudio :: Type

foreign import newPositionalAudio :: AudioListener -> Effect PositionalAudio

foreign import data Audio :: Type

foreign import newAudio :: AudioListener -> Effect Audio

-- EXPORTERS
foreign import data ColladaExporter :: Type

foreign import newColladaExporter :: Effect ColladaExporter

foreign import data EXRExporter :: Type

foreign import newEXRExporter :: Effect EXRExporter

foreign import data GLTFExporter :: Type

foreign import newGLTFExporter :: Effect GLTFExporter

foreign import data OBJExporter :: Type

foreign import newOBJExporter :: Effect OBJExporter

foreign import data PLYExporter :: Type

foreign import newPLYExporter :: Effect PLYExporter

-- WebGLRenderer

foreign import data WebGLProgram :: Type

-- note: should be a class for WebGLRenderer-s but for now, just Renderer...
foreign import newWebGLProgram :: Renderer -> String -> forall a. a -> Effect WebGLProgram

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

-- Textures

foreign import data Source :: Type

foreign import newSource :: forall a. a -> Effect Source

foreign import data CompressedTexture :: Type

foreign import newCompressedTexture :: forall a. a -> Number -> Number -> Constant -> Constant -> Constant -> Constant -> Constant -> Constant -> Constant -> Number -> Effect CompressedTexture

foreign import data CanvasTexture :: Type

foreign import newCanvasTexture :: HTML.HTMLCanvasElement -> Constant -> Constant -> Constant -> Constant -> Constant -> Constant -> Constant -> Number -> Effect CanvasTexture

foreign import data CompressedArrayTexture :: Type

foreign import newCompressedArrayTexture :: forall a. a -> Number -> Number -> Constant -> Constant -> Effect CompressedArrayTexture

foreign import data DepthTexture :: Type

foreign import newDepthTexture :: Number -> Number -> Constant -> Constant -> Constant -> Constant -> Constant -> Constant -> Number -> Constant -> Effect DepthTexture

foreign import data FramebufferTexture :: Type

foreign import newFramebufferTexture :: Number -> Number -> Constant -> Effect FramebufferTexture

-- Controls
foreign import data ArcballControls :: Type

foreign import newArcballControls :: Camera -> HTML.HTMLElement -> Scene -> Effect ArcballControls

foreign import data DragControls :: Type

foreign import newDragControls :: forall a. a -> Camera -> HTML.HTMLElement -> Effect DragControls

foreign import data FirstPersonControls :: Type

foreign import newFirstPersonControls :: Camera -> HTML.HTMLElement -> Effect FirstPersonControls

foreign import data FlyControls :: Type

foreign import newFlyControls :: Camera -> HTML.HTMLElement -> Effect FlyControls

foreign import data OrbitControls :: Type

foreign import newOrbitControls :: Camera -> HTML.HTMLElement -> Effect OrbitControls

foreign import data PointerLockControls :: Type

foreign import newPointerLockControls :: Camera -> HTML.HTMLElement -> Effect PointerLockControls

foreign import data TrackballControls :: Type

foreign import newTrackballControls :: Camera -> HTML.HTMLElement -> Effect TrackballControls

foreign import data TransformControls :: Type

foreign import newTransformControls :: Camera -> HTML.HTMLElement -> Effect TransformControls

--

foreign import requestAnimationFrame :: Effect Unit -> Effect Unit
