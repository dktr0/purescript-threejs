"use strict";

// Scene

export const newScene = () => new THREE.Scene();

export const newFog = color => near => far => () => new THREE.Fog(color, near, far);

export const newFogExp2 = color => density => () => new THREE.FogExp2(color, density);

// CAMERAS

// PerspectiveCamera

export const newPerspectiveCamera = fov => aspect => near => far => () => new THREE.PerspectiveCamera(fov,aspect,near,far);

export const setAspect = pCamera => aspect => () => pCamera.aspect = aspect;

// OrthographicCamera

export const newOrthographicCamera = left => right => top => bottom => near => far => () => new THREE.OrthographicCamera(left, right, top, bottom, near, far);

export const newArrayCamera = array => () => new THREE.ArrayCamera(array);

export const newCubeCamera = near => far => renderTarget => () => new THREE.CubeCamera(near, far, renderTarget);

export const newCamera = () => new THREE.Camera()

export const newStereoCamera = () => new THREE.StereoCamera()

// Renderer

export const newWebGLRenderer = params => () => new THREE.WebGLRenderer(params);

export const render = renderer => scene => camera => () => renderer.render(scene,camera);

export const setSize = renderer => w => h => updateStyle => () => renderer.setSize(w,h,updateStyle);

export const setClearColor = renderer => c => a => () => renderer.setClearColor(c,a);

export const renderListsDispose = renderer => () => renderer.renderLists.dispose();

export const newWebGLMultipleRenderTargets = width => height => count => options => () => new THREE.WebGLMultipleRenderTargets(width, height, count, options);

export const newWebGL1Renderer = parameters => () => new THREE.WebGL1Renderer(parameters);

export const newWebGLRenderTarget = width => height => parameters => () => new THREE.WebGLRenderTarget(width, height, parameters);

export const newWebGL3DRenderTarget = width => height => depth => () => new THREE.WebGL3DRenderTarget(width, height, depth);

export const newWebGLArrayRenderTarget = width => height => depth => () => new THREE.WebGLArrayRenderTarget(width, height, depth);

export const newWebGLCubeRenderTarget = size => options => () => new THREE.WebGLCubeRenderTarget(size, options);

export const newCSS2DRenderer = parameters => () => new THREE.CSS2DRenderer(parameters);

export const newCSS3DRenderer = parameters => () => new THREE.CSS3DRenderer(parameters);

export const newSVGRenderer = () => new THREE.SVGRenderer();



// 3D Object Loaders

//OBJ
  export const newOBJLoader = () => new THREE.OBJLoader();

  // note the handling of the callback in the line below...
  export const loadOBJ = loader => url => cb => () => loader.load(url,x => cb(x)());

  //MTL
  export const newMTLLoader = () => new THREE.MTLLoader();

  export const loadMTL= loader => url => cb => () => loader.load(url,x => cb(x)());


  //GLTF
  export const newGLTFLoader = () => new THREE.GLTFLoader();

  export const loadGLTF1 = loader => url => cb => () => loader.load(url,x => cb(x)());

//GLTF+DRACO
export const newDRACOLoader = () => new THREE.DRACOLoader();

export const setDecoderPath = dracoLoader => modulePath => () => dracoLoader.setDecoderPath(modulePath);

export const setDRACOLoader = gltfLoader => dracoLoader => () => gltfLoader.setDRACOLoader(dracoLoader);


// -- section deprecated --
export const loadGLTF = url => cb => () => new THREE.GLTFLoader().load(url,x => cb(x)());

export const loadOBJ1 = url => cb => () => new THREE.OBJLoader().load(url,x => cb(x)());

export const loadMTL1 = url => cb => () => new THREE.MTLLoader().load(url,x => cb(x)());
// ----- end of section -----

// Loaders
export const newMMDLoader = () => new THREE.MMDLoader();

export const loadMMD = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newPCDLoader = () => new THREE.PCDLoader();

export const loadPCD = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newFontLoader = () => new THREE.FontLoader();

export const loadFont = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newKTX2Loader = () => new THREE.KTX2Loader();

export const loadKTX2 = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newLDrawLoader = () => new THREE.LDrawLoader();

export const loadLDraw = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newPDBLoader = () => new THREE.PDBLoader();

export const loadPDB = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newPRWMLoader = () => new THREE.PRWMLoader();

export const loadPRWM = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newSVGLoader = () => new THREE.SVGLoader();

export const loadSVG = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newTGALoader = () => new THREE.TGALoader();

export const loadTGA = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newRhino3dmLoader = () => new THREE.Rhino3dmLoader();

export const loadRhino3dm = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newAnimationLoader = () => new THREE.AnimationLoader();

export const loadAnimation = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newAudioLoader = () => new THREE.AudioLoader();

export const loadAudio = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newBufferGeometryLoader = () => new THREE.BufferGeometryLoader();

export const loadBufferGeometry = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newCompressedTextureLoader = () => new THREE.CompressedTextureLoader();

export const loadCompressedTexture = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newCubeTextureLoader = () => new THREE.CubeTextureLoader();

export const loadCubeTexture = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newDataTextureLoader = () => new THREE.DataTextureLoader();

export const loadDataTexture = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newFileLoader = () => new THREE.FileLoader();

export const loadFile = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newImageBitmapLoader = () => new THREE.ImageBitmapLoader();

export const loadImageBitmap = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newImageLoader = () => new THREE.ImageLoader();

export const loadImage = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newLoader = () => new THREE.Loader();

export const loadLoader = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newMaterialLoader = () => new THREE.MaterialLoader();

export const loadMaterial = loader => url => cb => () => loader.load(url,x => cb(x)());

export const newObjectLoader = () => new THREE.ObjectLoader();

export const loadObject = loader => url => cb => () => loader.load(url,x => cb(x)());


// GROUPS

export const newGroup = () => new THREE.Group();

// Geometries

export const newPlaneGeometry = width => height => widthSegments => heightSegments => () => new THREE.PlaneGeometry(width,height,widthSegments,heightSegments);

export const newCapsuleGeometry = radius => length => capSegments => radialSegments => () => new THREE.CapsuleGeometry(radius,length,capSegments,radialSegments);

export const newSphereGeometry = radius => widthSegments => heightSegments => phiStart => phiLength => thetaStart => thetaLength => () => new THREE.SphereGeometry(radius, widthSegments, heightSegments, phiStart, phiLength, thetaStart, thetaLength);

export const newGridHelper = size => divisions => () => new THREE.GridHelper(size, divisions);

export const newTetrahedronGeometry = radius => detail => () => new THREE.TetrahedronGeometry(radius,detail);

export const newCircleGeometry = radius => segments => thetaStart => thetaLength => () => new THREE.CircleGeometry(radius,segments,thetaStart,thetaLength);

export const newConeGeometry = radius => height => radialSegments => heightSegments => openEnded => thetaStart => thetaLength => () => new THREE.ConeGeometry(radius,height,radialSegments,heightSegments, openEnded, thetaStart, thetaLength);

export const newCylinderGeometry = radiusTop => radiusBottom => height => radialSegments => heightSegments => openEnded => thetaStart => thetaLength => () => new THREE.CylinderGeometry(radiusTop, radiusBottom, height, radialSegments, heightSegments, openEnded, thetaStart, thetaLength);

export const newDodecahedronGeometry = radius => detail => () => new THREE.DodecahedronGeometry(radius,detail);

export const newTorusGeometry = radius => tube => radialSegments => tubularSegments => arc => () => new THREE.TorusGeometry(radius, tube, radialSegments, tubularSegments, arc);

export const newTorusKnotGeometry = radius => tube => tubularSegments => radialSegments => p => q => () => new THREE.TorusKnotGeometry(radius, tube, tubularSegments, radialSegments, p, q);

export const newWireframeGeometry = geometry => () => new THREE.WireframeGeometry(geometry);

export const newRingGeometry = innerRadius => outerRadius => thetaSegments => phiSegments => thetaStart => thetaLength => () => new THREE.RingGeometry(innerRadius, outerRadius, thetaSegments, phiSegments, thetaStart, thetaLength);

export const newOctahedronGeometry = radius => detail => () => new THREE.OctahedronGeometry(radius, detail);

export const newIcosahedronGeometry = radius => detail => () => new THREE.IcosahedronGeometry(radius, detail);

export const newTextGeometry = text => parameters => () => new THREE.TextGeometry(text, parameters);

export const newExtrudeGeometry = shapes => options => () => new THREE.ExtrudeGeometry(shapes, options);

export const newLatheGeometry = points => segments => phiStart => phiLength => () => new THREE.LatheGeometry(points, segments, phiStart, phiLength);

export const newPolyhedronGeometry = vertices => indices => radius => detail => () => new THREE.PolyhedronGeometry(vertices, indices, radius, detail);

export const newShapeGeometry = shapes => curveSegments => () => new THREE.ShapeGeometry(shapes, curveSegments);

export const newConvexGeometry = points => () => new THREE.ConvexGeometry(points);

export const newTubeGeometry = path => tubularSegments => radius => radialSegments => closed => () => new THREE.TubeGeometry(path, tubularSegments, radius, radialSegments, closed);

export const newEdgesGeometry = geometry => () => new THREE.EdgesGeometry(geometry);

// Mesh

export const newMesh = geometry => material => () => new THREE.Mesh(geometry,material);

export const setReceiveShadow = mesh => boolean => () => mesh.receiveShadow = boolean;

//////////

export const setColorInt = thing => color => () => thing.color = new THREE.Color(color);

export const addAnything = a => b => () => a.add(b);

export const addAnythingToScene = scene => anything => () => scene.add(anything);

export const cloneObject3D = object3D => recursive => () => object3D.clone(recursive);

export const copyObject3D = parent => object3D => recursive => () => parent.copy(object3D,recursive);

export const removeObject3D = parent => child => () => parent.remove(child);

export const removeFromParent = obj3D => () => obj3D.removeFromParent();

export const rotationX = thing => () => thing.rotation.x;

export const rotationY = thing => () => thing.rotation.y;

export const rotationZ = thing => () => thing.rotation.z;

export const setRotationOfAnything = thing => x => y => z => () => thing.rotation.set(x,y,z);

export const setScaleOfAnything = thing => x => y => z => () => thing.scale.set(x,y,z);

export const setRepeatOfAnything = thing => u => v => () => thing.repeat.set(u,v);

export const preloadAnything = elem => () => elem.preload = "auto"; // erase this one in the future

export const playAnything = thing => () => thing.play();

export const printAnything = thing => () => console.log(thing);

// LIGHTS

export const newHemisphereLight = skyColor => groundColor => intensity => () => new THREE.HemisphereLight(skyColor,groundColor,intensity);

export const newAmbientLight = rgb => intensity => () => new THREE.AmbientLight(rgb,intensity);

export const newDirectionalLight = rgb => intensity => () => new THREE.DirectionalLight(rgb,intensity);

export const newPointLight = rgb => intensity => distance => decay => () => new THREE.PointLight(rgb,intensity,distance,decay);

export const newAmbientLightProbe = color => intensity => () => new THREE.AmbientLightProbe(color, intensity);

export const newLight = color => intensity => () => new THREE.Light(color, intensity);

export const newRectAreaLight = rgb => intensity => width => height => () => new THREE.RectAreaLight(rgb,intensity, width, height);

export const newHemisphereLightProbe = skyColor => groundColor => intensity => () => new THREE.HemisphereLightProbe(skyColor, groundColor, intensity);

export const newSpotLight = rgb => intensity => distance => angle => penumbra => decay => () => new THREE.SpotLight(rgb,intensity, distance, angle, penumbra, decay);

export const newLightProbe = sh => intensity => () => new THREE.LightProbe(sh, intensity);


// LIGHTS / SHADOWS

export const newLightShadow = camera => () => new THREE.LightShadow(camera);

export const newPointLightShadow = () => new THREE.PointLightShadow();

export const newDirectionalLightShadow = () => new THREE.DirectionalLightShadow();


// HELPERS

export const newArrowHelper = dir => origin => length => hex => headLength => headWidth => () => new THREE.ArrowHelper(dir, origin, length, hex, headLength, headWidth);

export const newAxesHelper = size => () => new THREE.AxesHelper(size);

export const newBoxHelper = object => color => () => new THREE.BoxHelper(object, color);

export const newBox3Helper = box => color => () => new THREE.Box3Helper(box, color);

export const newCameraHelper = camera => () => new THREE.CameraHelper(camera);

export const newPlaneHelper = plane => size => hex => () => new THREE.PlaneHelper(plane, size, hex);

export const newDirectionalLightHelper = light => size => color => () => new THREE.DirectionalLightHelper(light, size, color);

export const newHemisphereLightHelper = light => sphereSize => color => () => new THREE.HemisphereLightHelper(light, sphereSize, color);

export const newPointLightHelper = light => sphereSize => color => () => new THREE.PointLightHelper(light, sphereSize, color);

export const newSpotLightHelper = light => color => () => new THREE.SpotLightHelper(light, color);

export const newSkeletonHelper = object => () => new THREE.SkeletonHelper(object);

export const newLightProbeHelper = lightProbe => size => () => new THREE.LightProbeHelper(lightProbe, size);

export const newPositionalAudioHelper = audio => range => () => new THREE.PositionalAudioHelper(audio, range);

export const newRectAreaLightHelper = light => color => () => new THREE.RectAreaLightHelper(light, color);

export const newVertexNormalsHelper = object => size => color => () => new THREE.VertexNormalsHelper(object, size, color);

export const newVertexTangentsHelper = object => size => color => () => new THREE.VertexTangentsHelper(object, size, color);

// MATH

export const newVector2 = x => y => () => new THREE.Vector2(x, y);

export const newVector3 = x => y => z => () => new THREE.Vector3(x, y, z);

export const newBox3 = min => max => () => new THREE.Box3(min, max);

export const newPlane = normal => constant => () => new THREE.Plane(normal, constant);

export const newBox2 = min => max => () => new THREE.Box2(min, max);

export const newCylindrical = radius => theta => y => () => new THREE.Cylindrical(radius, theta, y);

export const newEuler = x => y => z => order => () => new THREE.Euler(x, y, z, order);

export const newFrustum = p0 => p1 => p2 => p3 => p4 => p5 => () => new THREE.Frustum(p0, p1, p2, p3, p4, p5);

export const newLine3 = start => end => () => new THREE.Line3(start, end);

export const newQuaternion = x => y => z => w => () => new THREE.Quaternion(x, y, z, w);

export const newRay = origin => direction => () => new THREE.Ray(origin, direction);

export const newSphere = center => radius => () => new THREE.Sphere(center, radius);

export const newSpherical = radius => phi => theta => () => new THREE.Spherical(radius, phi, theta);

export const newTriangle = a => b => c => () => new THREE.Triangle(a, b, c);

export const newVector4 = x => y => z => w => () => new THREE.Vector4(x, y, z, w);

export const newLut = colormap => count => () => new THREE.Lut(colormap, count);

export const newMeshSurfaceSampler = mesh => () => new THREE.MeshSurfaceSampler(mesh);

export const newSphericalHarmonics3 = () => new THREE.SphericalHarmonics3();

export const newMatrix3 = () => new THREE.Matrix3();

export const newMatrix4 = () => new THREE.Matrix4();

export const newOBB = center => halfSize => rotation => () => new THREE.OBB(center, halfSize, rotation);

export const newColor = r => () => new THREE.Color(r);

// MATH / INTERPOLANTS
export const newCubicInterpolant = parameterPositions => sampleValues => sampleSize => resultBuffer => () => new THREE.CubicInterpolant(parameterPositions, sampleValues, sampleSize, resultBuffer);

export const newDiscreteInterpolant = parameterPositions => sampleValues => sampleSize => resultBuffer => () => new THREE.DiscreteInterpolant(parameterPositions, sampleValues, sampleSize, resultBuffer);

export const newLinearInterpolant = parameterPositions => sampleValues => sampleSize => resultBuffer => () => new THREE.LinearInterpolant(parameterPositions, sampleValues, sampleSize, resultBuffer);

export const newQuaternionLinearInterpolant = parameterPositions => sampleValues => sampleSize => resultBuffer => () => new THREE.QuaternionLinearInterpolant(parameterPositions, sampleValues, sampleSize, resultBuffer);

//

export const newPolarGridHelper = radius => radials => circles => divisions => () => new THREE.PolarGridHelper(radius,radials,circles,divisions)

export const windowInnerWidth = () => window.innerWidth;

export const windowInnerHeight = () => window.innerHeight;

export const newAnimationMixer = object3D => () => new THREE.AnimationMixer(object3D);

export const updateAnimationMixer = mixer => delta => () => mixer.update(delta);

export const clipAction = animationMixer => clip => () => animationMixer.clipAction(clip);

export const setEffectiveTimeScale = animationAction => t => () => animationAction.setEffectiveTimeScale(t);

export const setDuration = animationAction => durationInSeconds => () => animationAction.setDuration(durationInSeconds);

export const setEffectiveWeight = animationAction => weight => () => animationAction.setEffectiveWeight(weight);

export const crossFadeFrom = animationAction => fadeOutAction => durationInSeconds => warpBoolean => () => animationAction.crossFadeFrom(fadeOutAction,durationInSeconds,warpBoolean);

export const crossFadeTo = animationAction => fadeInAction => durationInSeconds => warpBoolean => () => animationAction.crossFadeFrom(fadeInAction,durationInSeconds,warpBoolean);

export const fadeIn = animationAction => t => () => animationAction.fadeIn(t);

export const fadeOut = animationAction => t => () => animationAction.fadeOut(t);

export const stop = animationAction => () => animationAction.stop();

// GEOMETRIES

export const newBoxGeometry = w => h => d => () => new THREE.BoxGeometry(w,h,d);

// Objects

export const newLine = geometry => material => () => new THREE.Line(geometry, material);

export const newPoints = geometry => material => () => new THREE.Points(geometry, material);

export const newSprite = material => () => new THREE.Sprite(material);

export const newInstancedMesh = geometry => material => count => () => new THREE.InstancedMesh(geometry, material, count);

export const newLineLoop = geometry => material => () => new THREE.LineLoop(geometry, material);

export const newLineSegments = geometry => material => () => new THREE.LineSegments(geometry, material);

export const newSkinnedMesh = geometry => material => () => new THREE.SkinnedMesh(geometry, material);

export const newSkeleton = bones => boneInverses => () => new THREE.Skeleton(bones, boneInverses);

export const newBone = () => new THREE.Bone();

export const newLOD = () => new THREE.LOD();

// Materials

export const meshBasicMaterial = params => () => new THREE.MeshBasicMaterial(params);

export const newMeshPhongMaterial = parameters => () => new THREE.MeshPhongMaterial(parameters);

export const newMeshStandardMaterial = parameters => () => new THREE.MeshStandardMaterial(parameters);

export const newSpriteMaterial = parameters => () => new THREE.SpriteMaterial(parameters);

export const shadowMaterial = params => () => new THREE.ShadowMaterial(params);

export const shaderMaterial = params => () => new THREE.ShaderMaterial(params);

export const rawShaderMaterial = params => () => new THREE.RawShaderMaterial(params);

export const meshToonMaterial = params => () => new THREE.MeshToonMaterial(params);

export const meshPhysicalMaterial = params => () => new THREE.MeshPhysicalMaterial(params);

export const meshNormalMaterial = params => () => new THREE.MeshNormalMaterial(params);

export const meshMatcapMaterial = params => () => new THREE.MeshMatcapMaterial(params);

export const meshLambertMaterial = params => () => new THREE.MeshLambertMaterial(params);

export const meshDistanceMaterial = params => () => new THREE.MeshDistanceMaterial(params);

export const meshDepthMaterial = params => () => new THREE.MeshDepthMaterial(params);

export const lineDashedMaterial = params => () => new THREE.LineDashedMaterial(params);

export const lineBasicMaterial = params => () => new THREE.LineBasicMaterial(params);

export const pointsMaterial = params => () => new THREE.PointsMaterial(params);

export const newMaterial = () => new THREE.Material();

// CORE

export const newClock = autoStart => () => new THREE.Clock(autoStart);

export const newRaycaster = origin => direction => near => far => () => new THREE.Raycaster(origin, direction, near, far);

export const newUniform = value => () => new THREE.Uniform(value);

export const newBufferGeometry = () => new THREE.BufferGeometry();

export const newEventDispatcher = () => new THREE.EventDispatcher();

export const newInstancedBufferGeometry = () => new THREE.InstancedBufferGeometry();

export const newLayers = () => new THREE.Layers();

export const newObject3D = () => new THREE.Object3D();

// ANIMATION

export const newAnimationClip = name => duration => tracks => () => new THREE.AnimationClip(name, duration, tracks);

export const newKeyframeTrack = name => times => values => interpolation => () => new THREE.KeyframeTrack(name, times, values, interpolation);


// ANIMATION / TRACKS

export const newBooleanKeyframeTrack = name => times => values => () => new THREE.BooleanKeyframeTrack(name, times, values);

export const newColorKeyframeTrack = name => times => values => () => new THREE.ColorKeyframeTrack(name, times, values);

export const newNumberKeyframeTrack = name => times => values => () => new THREE.NumberKeyframeTrack(name, times, values);

export const newQuaternionKeyframeTrack = name => times => values => () => new THREE.QuaternionKeyframeTrack(name, times, values);

export const newStringKeyframeTrack = name => times => values => () => new THREE.StringKeyframeTrack(name, times, values);

export const newVectorKeyframeTrack = name => times => values => () => new THREE.VectorKeyframeTrack(name, times, values);

// CORE / BUFFERATTRIBUTES

export const newTypedBufferAttribute = array => itemSize => normalized => () => new THREE.TypedBufferAttribute(array, itemSize, normalized);

// EXTRAS / CORE

export const newPath = points => () => new THREE.Path(points);

export const newShape = points => () => new THREE.Shape(points);

export const newCurve = () => new THREE.Curve();

export const newCurvePath = () => new THREE.CurvePath();

export const newShapePath = () => new THREE.ShapePath();

// EXTRAS / CURVES

export const newCatmullRomCurve3 = points => closed => curveType => tension => () => new THREE.CatmullRomCurve3(points, closed, curveType, tension);

export const newCubicBezierCurve = v0 => v1 => v2 => v3 => () => new THREE.CubicBezierCurve(v0, v1, v2, v3);

export const newCubicBezierCurve3 = v0 => v1 => v2 => v3 => () => new THREE.CubicBezierCurve3(v0, v1, v2, v3);

export const newLineCurve = v1 => v2 => () => new THREE.LineCurve(v1, v2);

export const newLineCurve3 = v1 => v2 => () => new THREE.LineCurve3(v1, v2);

export const newQuadraticBezierCurve = v0 => v1 => v2 => () => new THREE.QuadraticBezierCurve(v0, v1, v2);

export const newQuadraticBezierCurve3 = v0 => v1 => v2 => () => new THREE.QuadraticBezierCurve3(v0, v1, v2);

export const newSplineCurve = points => () => new THREE.SplineCurve(points);

export const newEllipseCurve = aX => aY => xRadius => yRadius => aStartAngle => aEndAngle => aClockwise => aRotation => () => new THREE.EllipseCurve(aX, aY, xRadius, yRadius, aStartAngle, aEndAngle, aClockwise, aRotation);

// ANIMATIONS

export const newCCDIKSolver = mesh => iks => () => new THREE.CCDIKSolver(mesh, iks);

export const newMMDAnimationHelper = params => () => new THREE.MMDAnimationHelper(params);

export const newMMDPhysics = mesh => rigidBodyParams => constraintParams => params => () => new THREE.MMDPhysics(mesh, rigidBodyParams, constraintParams, params);

// POST-PROCESSING

export const newEffectComposer = renderer => renderTarget => () => new THREE.EffectComposer(renderer, renderTarget);

// CONVEXHULL

export const newVertexNode = point => () => new THREE.VertexNode(point);

export const newFace = () => new THREE.Face();

export const newHalfEdge = vertex => face => () => new THREE.HalfEdge(vertex, face);

export const newConvexHull = () => new THREE.ConvexHull();

export const newVertexList = () => new THREE.VertexList();

// AUDIO

export const newAudioListener = () => new THREE.AudioListener()

export const newPositionalAudio = listener => () => new THREE.PositionalAudio(listener)

export const newAudio = listener => () => new THREE.Audio(listener)

// EXPORTERS

export const newColladaExporter = () => new THREE.ColladaExporter();

export const newEXRExporter = () => new THREE.EXRExporter();

export const newGLTFExporter = () => new THREE.GLTFExporter();

export const newOBJExporter = () => new THREE.OBJExporter();

export const newPLYExporter = () => new THREE.PLYExporter();

// WebGLRenderer

export const newWebGLProgram = renderer => cacheKey => parameters => () => new THREE.WebGLProgram(renderer, cacheKey, parameters);

// TEXTURE

// loading

export const textureLoader = url => () => new THREE.TextureLoader().load(url);

export const createElement = name => () => document.createElement(name);

export const getElementById = id => () => document.getElementById(id);

export const videoTexture = videoElem => () => new THREE.VideoTexture(videoElem);

// changing

export const clampToEdgeWrapping = THREE.ClampToEdgeWrapping

export const repeatWrapping = THREE.RepeatWrapping

export const mirroredRepeatWrapping = THREE.MirroredRepeatWrapping

export const wrapS = texture => wrap => () => texture.wrapS = wrap;

export const wrapT = texture => wrap => () => texture.wrapT = wrap;

export const nearestFilter = THREE.NearestFilter;

export const linearFilter = THREE.LinearFilter;

export const minFilter = texture => filter => () => texture.minFilter = filter;

export const magFilter = texture => filter => () => texture.magFilter = filter;

// Textures

export const newSource = data => () => new THREE.Source(data);

export const newCompressedTexture = mipmaps => width => height => format => type => mapping => wrapS => wrapT => magFilter => minFilter => anisotropy => () => new THREE.CompressedTexture(mipmaps, width, height, format, type, mapping, wrapS, wrapT, magFilter, minFilter, anisotropy);

export const newCanvasTexture = canvas => mapping => wrapS => wrapT => magFilter => minFilter => format => type => anisotropy => () => new THREE.CanvasTexture(canvas, mapping, wrapS, wrapT, magFilter, minFilter, format, type, anisotropy);

export const newCompressedArrayTexture = mipmaps => width => height => format => type => () => new THREE.CompressedArrayTexture(mipmaps, width, height, format, type);

export const newDepthTexture = width => height => type => mapping => wrapS => wrapT => magFilter => minFilter => anisotropy => format => () => new THREE.DepthTexture(width, height, type, mapping, wrapS, wrapT, magFilter, minFilter, anisotropy, format);

export const newFramebufferTexture = width => height => format => () => new THREE.FramebufferTexture(width, height, format);

// Controls

export const newArcballControls = camera => domElement => scene => () => new THREE.ArcballControls(camera, domElement, scene);

export const newDragControls = objects => camera => domElement => () => new THREE.DragControls(objects, camera, domElement);

export const newFirstPersonControls = object => domElement => () => new THREE.FirstPersonControls(object, domElement);

export const newFlyControls = object => domElement => () => new THREE.FlyControls(object, domElement);

export const newOrbitControls = object => domElement => () => new THREE.OrbitControls(object, domElement);

export const newPointerLockControls = camera => domElement => () => new THREE.PointerLockControls(camera, domElement);

export const newTrackballControls = camera => domElement => () => new THREE.TrackballControls(camera, domElement);

export const newTransformControls = camera => domElement => () => new THREE.TransformControls(camera, domElement);

//

export const requestAnimationFrame = callback => () => window.requestAnimationFrame(callback)
