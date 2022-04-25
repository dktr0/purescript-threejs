"use strict";

// 3D object Loaders

// note the rather weird handling of the callback in the line below...
// ... seems to be necessary when we try to pass a callback with argument from PureScript
//                              url              cb
// foreign import loadGLTF :: String -> (GLTF -> Effect Unit) -> Effect Unit

exports.loadGLTF = url => cb => () => new THREE.GLTFLoader().load(url,x => cb(x)());

// const loader = new GLTFLoader().load('url', function (gltf){});

exports.loadMTL = url => cb => () => new THREE.MTLLoader().load(url,x => cb(x)());

// var mtlLoader = new MTLLoader().load("url", function (materials){});

exports.loadOBJ = url => cb => () => new THREE.OBJLoader().load(url,x => cb(x)());

// var objLoader = new OBJLoader().load("url", function (object){});

//////////

exports.addAnythingToScene = scene => anything => () => scene.add(anything);

exports.setPositionOfAnything = thing => x => y => z => () => thing.position.set(x,y,z);

exports.setRotationOfAnything = thing => x => y => z => () => thing.rotation.set(x,y,z);

exports.setScaleOfAnything = thing => x => y => z => () => thing.scale.set(x,y,z);

exports.setRepeatOfAnything = thing => u => v => () => thing.repeat.set(u,v);

exports.preloadAnything = elem => () => elem.preload = "auto";

// LIGHTS

exports.hemisphereLight = skyColor => groundColor => intensity => () => new THREE.HemisphereLight(skyColor,groundColor,intensity);

exports.newAmbientLight = rgb => intensity => () => new THREE.AmbientLight(rgb,intensity);

exports.newDirectionalLight = rgb => intensity => () => new THREE.DirectionalLight(rgb,intensity);

exports.newPointLight = rgb => intensity => distance => decay => () => new
THREE.PointLight(rgb,intensity,distance,decay);

//

exports.newPolarGridHelper = radius => radials => circles => divisions => () => new THREE.PolarGridHelper(radius,radials,circles,divisions)

exports.windowInnerWidth = () => window.innerWidth;

exports.windowInnerHeight = () => window.innerHeight;

exports.newAnimationMixer = object3D => () => new THREE.AnimationMixer(object3D);

exports.updateAnimationMixer = mixer => delta => () => mixer.update(delta);

exports.clipAction = animationMixer => clip => () => animationMixer.clipAction(clip);

exports.setEffectiveTimeScale = action => t => () => action.setEffectiveTimeScale(t);

exports.print = thing => () => console.log(thing);

exports.requestAnimationFrame = callback => () => window.requestAnimationFrame(callback)

// TEXTURE

// loading

exports.textureLoader = url => () => new THREE.TextureLoader().load(url);

exports.createElement = name => () => document.createElement(name);

exports.srcOfElement = elem => url => () => elem.src = url;

exports.getElementById = idName => () => document.getElementById(idName);

exports.videoTexture = videoElem => () => new THREE.VideoTexture(videoElem);

// changing

exports.clampToEdgeWrapping = THREE.ClampToEdgeWrapping

exports.repeatWrapping = THREE.RepeatWrapping

exports.mirroredRepeatWrapping = THREE.MirroredRepeatWrapping

exports.wrapS = texture => wrap => () => texture.wrapS = wrap;

exports.wrapT = texture => wrap => () => texture.wrapT = wrap;

exports.nearestFilter = THREE.NearestFilter;

exports.linearFilter = THREE.LinearFilter;

exports.minFilter = texture => filter => () => texture.minFilter = filter

exports.magFilter = texture => filter => () => texture.magFilter = filter

// video settings

exports.play = videoElem => () => videoElem.play();

// exports.play = videoElem => () => document.onkeydown = function (e) {
//   if (e.keyCode === 80) {
//     videoElem.play()
//   }}

exports.insertTexture = texture => c => () => materials.materials.None.map = texture;
object.children[c].material = materials.materials.None;







exports.loop = videoElem => bool => () => videoElem.loop = bool;

exports.muted = videoElem => bool => () => videoElem.muted = bool;

exports.volume = videoElem => float => () => videoElem.volumen = float;

exports.autoplay = videoElem => bool => () => videoElem.autoplay = bool;
