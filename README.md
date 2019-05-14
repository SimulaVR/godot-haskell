# godot-haskell

[![Build Status](https://travis-ci.org/SimulaVR/godot-haskell.svg?branch=master)](https://travis-ci.org/SimulaVR/godot-haskell)

Haskell bindings for the Godot game engine.

* Low-level stuff (GDNative) resides in Godot.Gdnative
* Nativescript stuff (binding classes/methods/etc) is in Godot.Nativescript
* High-level stuff (classes generated from the API description) is in Godot.Api
* To access methods import modules from Godot.Core.

## Getting started (demo game)

The easiest way to get started is to have a look at the demo game included in
this repo in the 'demo' directory. This is "Dodge the Creeps!", your first game
from the [Godot
documentation](https://docs.godotengine.org/en/3.1/getting_started/step_by_step/your_first_game.html). Following
along with the documentation and the code should make everything understandable.

Higher-level bindings are found in Godot.Nativescript. These include many
convenience functions for defining Godot objects, declaring their properties,
and dealing with signals and async code.

Run the demo by doing a `make stack` then loading the demo into the Godot editor
with `godot game/project.godot`. To run it in the editor press F5, stop with
F8.

## Known issues & inconveniences

* Script variables only appear in the editor when you reload it.
* You have to register each class in 'exports'.
* No type safety around signals or node paths; can still reference missing ones.
* No type safety for call_deferred.
* Every time you add a new node which needs a native script you need to manually
  select the library. It's tedious right now. This is the procedure for adding a
  new node backed by Haskell code: create the node, right click it, attach a
  script, select nativescript, the script will open in the editor, in the
  inspector find the Library subheading under NativeScript, click [empty], pick
  Load, the file picker will open, open lib, and select libmyproject.dnlib or
  whatever you've renamed the library to. That's it. Don't edit the emppty file
  that's been opened. Now in Haskell, you can create a class with the same name
  as the Godot one and that inherits from the same type. See the demo. There is
  a ticket in Godot to automate this process :(

## Setting up your own project.

You can either modify the mode, or set up a new demo project in `template/demo/`
for an example of how to use this library. You can use the stack template
(`template/godot-haskell.hsroots`) to set up a basis for your own project.

To use the template:

```bash
stack new myproject https://raw.githubusercontent.com/SimulaVR/godot-haskell/master/template/godot-haskell.hsfiles
```

## Changing Godot versions

You will need to regenerate the bindings if you switch Godot versions. At
present, these are generated for the version that corresponds to the
godot_headers submodule included here. This was 3.1 at the time of writing.

To regenerate bindings:

* Replace godot_headers with a version that corresponds to your
  install. Instructions are included there, but that generally means either
  checking out the corresponding files or rebuilding Godot.
* Check out a copy of the godot repo. You don't need to build this, but you
  probably will anyway. We need it because documentation files are not 
  included in the api.json file found in godot_headers.
* Summarize the documentation xml files into a json file:
xml-to-json godot-install-directory/doc/classes/*.xml | jq -n '[inputs]' &> godot_doc_classes.json
* Build the bindings themselves:
cd classgen
stack build
cd ..
rm src/Godot/Core/* src/Godot/Tools/*
stack exec godot-haskell-classgen ../godot_headers/api.json ../godot_doc_classes.json

That's it! The rest of the bindings are fairly lightweight with few
dependencies, so you shouldn't see much breakage in the rest of the package.

## Questions

The primary method of contact is the SimulaVR [Discord server](https://discord.gg/V2NgzZt).
Mirrors are available at [![Gitter](https://badges.gitter.im/SimulaVR/Simula.svg)](https://gitter.im/SimulaVR/Simula?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge) and in the SimulaVR channel at Matrix.

## Docs

Most of the API is documented but the lowest-level bindings, like GDNative
functions don't have documentation. Godot itself doesn't have documentation for
these so there's not much to do there. They are quite intuitive to use though.
