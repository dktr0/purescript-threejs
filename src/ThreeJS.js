"use strict";

// Scene

export const newScene = () => new THREE.Scene();


// PerspectiveCamera

export const newPerspectiveCamera = fov => aspect => near => far => () => new THREE.PerspectiveCamera(fov,aspect,near,far);

export const setAspect = pCamera => aspect => () => pCamera.aspect = aspect;

// OrthographicCamera

export const newOrthographicCamera = left => right => top => bottom => near => far => () => new THREE.OrthographicCamera(left, right, top, bottom, near, far);


// Renderer

export const newWebGLRenderer = params => () => new THREE.WebGLRenderer(params);

export const render = renderer => scene => camera => () => renderer.render(scene,camera);

export const setSize = renderer => w => h => updateStyle => () => renderer.setSize(w,h,updateStyle);

export const renderListsDispose = renderer => () => renderer.renderLists.dispose();


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

export const setPositionOfAnything = thing => x => y => z => () => thing.position.set(x,y,z);

// export const getPositionOfAnything = thing => () => thing.position;

export const setPositionX = thing => x => () => thing.position.setX(x);

export const setPositionY = thing => y => () => thing.position.setY(y);

export const setPositionZ = thing => z => () => thing.position.setZ(z);

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

// MATH

export const newVector2 = x => y => () => new THREE.Vector2(x, y);

export const newVector3 = x => y => z => () => new THREE.Vector3(x, y, z);

export const newBox3 = min => max => () => new THREE.Box3(min, max);

export const newPlane = normal => constant => () => new THREE.Plane(normal, constant);

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

//

export const requestAnimationFrame = callback => () => window.requestAnimationFrame(callback)
