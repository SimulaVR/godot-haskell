# godot-haskell

Haskell bindings for the Godot game engine.
* Low-level stuff (GDNative) resides in Godot.Gdnative
* Nativescript stuff (binding classes/methods/etc) is in Godot.Nativescript
* High-level stuff (classes generated from the API description) is in Godot.Api, whereas methods are in Godot.Methods

## Using the library

See the demo project in `template/demo/` for an example of how to use this
library. You can use the stack template (`template/godot-haskell.hsroots`) to
set up a basis for your own project.

To use the template:
```
stack new myproject https://raw.githubusercontent.com/SimulaVR/godot-haskell/master/template/godot-haskell.hsfiles
```

## Questions

Questions, etc are best asked in the Gitter chatroom for SimulaVR: [![Gitter](https://badges.gitter.im/SimulaVR/Simula.svg)](https://gitter.im/SimulaVR/Simula?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## Docs

The Haskell specific stuff is documented, but I'm not importing the docstrings from the Godot API yet. Refer to the Godot docs for that
