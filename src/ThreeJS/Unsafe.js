"use strict";

// for class Object3D

export const lookAt = thing => x => y => z => () => thing.lookAt(x,y,z);

export const setPosition = thing => x => y => z => () => thing.position.set(x,y,z);

export const setPositionX = thing => x => () => thing.position.setX(x);

export const setPositionY = thing => y => () => thing.position.setY(y);

export const setPositionZ = thing => z => () => thing.position.setZ(z);

export const getRotationX = thing => () => thing.rotation.x;

export const getRotationY = thing => () => thing.rotation.y;

export const getRotationZ = thing => () => thing.rotation.z;

export const setRotation = thing => x => y => z => () => thing.rotation.set(x,y,z);

export const setRotationX = thing => x => () => thing.rotation.setX(x);

export const setRotationY = thing => y => () => thing.rotation.setY(y);

export const setRotationZ = thing => z => () => thing.rotation.setZ(z);

// for class Light

export const getLightColor = x => () => x.color;
export const setLightColor = l => x => () => l.color = x;
export const getLightIntensity = x => () => x.intensity;
export const setLightIntensity = l => x => () => l.intensity = x;
