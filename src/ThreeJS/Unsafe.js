"use strict";

export const setPosition = thing => x => y => z => () => thing.position.set(x,y,z);

export const setPositionX = thing => x => () => thing.position.setX(x);

export const setPositionY = thing => y => () => thing.position.setY(y);

export const setPositionZ = thing => z => () => thing.position.setZ(z);
