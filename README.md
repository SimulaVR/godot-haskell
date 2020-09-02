# godot-haskell

[![Build Status](https://travis-ci.org/SimulaVR/godot-haskell.svg?branch=master)](https://travis-ci.org/SimulaVR/godot-haskell)

Haskell bindings for the Godot game engine.
* Low-level stuff (GDNative) resides in Godot.Gdnative
* Nativescript stuff (binding classes/methods/etc) is in Godot.Nativescript
* High-level stuff (classes generated from the API description) is in Godot.Api, whereas methods are in Godot.Methods

This is feature complete and actively maintained.

## Using the library

See the demo project in `template/demo/` for an example of how to use this
library. You can use the stack template (`template/godot-haskell.hsfiles`) to
set up a basis for your own project.

To use the template:
```
stack new myproject https://raw.githubusercontent.com/SimulaVR/godot-haskell/master/template/godot-haskell.hsfiles
```

## Questions

The primary method of contact is the SimulaVR [Discord server](https://discord.gg/V2NgzZt).
Mirrors are available at [![Gitter](https://badges.gitter.im/SimulaVR/Simula.svg)](https://gitter.im/SimulaVR/Simula?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge) and in the SimulaVR channel at Matrix.

## Docs

The Haskell specific stuff is documented, but I'm not importing the docstrings from the Godot API yet. Refer to the Godot docs for that
