# godot-haskell

[![Build Status](https://travis-ci.org/SimulaVR/godot-haskell.svg?branch=master)](https://travis-ci.org/SimulaVR/godot-haskell)

Haskell bindings for the Godot game engine.

* Low-level (GDNative) in Godot.Gdnative
* Nativescript (binding classes/methods/etc) in Godot.Nativescript
* High-level (classes generated from the API ) in Godot.Api
* Access methods through Godot.Core

## Getting started (demo game)

The easiest way to get started is to have a look at the demo game included in
the [demo](https://github.com/SimulaVR/godot-haskell/tree/master/demo)
directory. This is "Dodge the Creeps!", your first game from the [Godot
documentation](https://docs.godotengine.org/en/3.1/getting_started/step_by_step/your_first_game.html). Following
along with the documentation and the code should make everything understandable.

To build:
```bash
git clone --recursive https://github.com/SimulaVR/godot-haskell
cd godot-haskell/demo
make
```

To make changes to the game, in two different terminals:
```bash
make stack-watch
make project-watch
```

The first command will constantly build Haskell code and copy the shared library
into the Godot project, demo. The second command will constantly scan the Godot
project and build Haskell code out of it.

Load up the game by importing `game/project.godot` into the editor, which you
can do from the commandline with `godot game/project.godot`. To run the game in
the editor press F5, stop it with F8.

### Understanding the demo game

There are two parts of the demo. `demo/game` which is the Godot project and
`demo/src` which are the Haskell sources. When you run `cd demo && make stack`
to build the demo, it builds the project locally with `stack build` and then
does a `cp` to copy the resulting shared library into the right place in
`demo/game`. This way Godot will pick it up. If you just do a `stack build`
without copying, your shared library will never update and Godot will run the
old code.

You must regenerate `demo/src/Project` any time you modify the Godot
project. This directory contains the Godot project mirrored into Haskell, just
like @Servant@ provides you with API safety by declaring APIs in Haskell. When
you change the name of a node in Godot, this will update a Haskell class
instance, which will lead to a type error in your project. You can do this with
`stack exec godot-haskell-parse-game game src` which will watch your project for
changes.

## Known issues & inconveniences

* Script variables only appear in the editor when you reload it.
* No type safety around signal arguments.
* No type safety for call and call_deferred.
* Quite a bit of boilerplate for every new class, we're slowly automating it.
* Every time you add a new node which needs a native script you need to manually
  select the library. It's tedious right now. This is the procedure for adding a
  new node backed by Haskell code: create the node, right click it, attach a
  script, select nativescript, the script will open in the editor, in the
  inspector find the Library subheading under NativeScript, click [empty], pick
  Load, the file picker will open, open lib, and select libmyproject.dnlib or
  whatever you've renamed the library to. That's it. Don't edit the empty file
  that's been opened. Now in Haskell, you can create a class with the same name
  as the Godot one and that inherits from the same type. See the demo. There is
  a ticket in Godot to automate this process :(

## Setting up your own project.

You can either modify the demo described above, or set up a new project from a
stack template found in the template directory. The easiest way to get started
is to head over to `template/demo` and run `make stack`.

If you want to start another project use the stack template `template/godot-haskell.hsroots`
Alternatively, fetch it directly from git:

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
* Check out a copy of the godot repo and make sure you're on the commit
  corresponding to your version of godot. You don't need to build this, but you
  probably will anyway. We need it because documentation files are not included
  in the api.json file found in godot_headers.
* Summarize the documentation xml files into a json file:

```bash
# Prerequisite
sudo apt-get install jq libcurl4-gnutls-dev # Or equivalent on you OS/Distro
cabal install xml-to-json

# Generate the JSON
xml-to-json godot-install-directory/doc/classes/*.xml | jq -n '[inputs]' &> godot_doc_classes.json
```

* Build the bindings themselves:

```bash
cd classgen
stack build
rm ../src/Godot/Core/* ../src/Godot/Tools/*
stack exec godot-haskell-classgen -- ../godot_headers/api.json ../godot_doc_classes.json ../
```

That's it! The rest of the bindings are fairly lightweight with few
dependencies, so you shouldn't see much breakage in the rest of the package.

## Questions

The primary method of contact is the SimulaVR [Discord server](https://discord.gg/V2NgzZt).
Mirrors are available at [![Gitter](https://badges.gitter.im/SimulaVR/Simula.svg)](https://gitter.im/SimulaVR/Simula?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge) and in the SimulaVR channel at Matrix.

## Docs

Most of the API is documented but the lowest-level bindings, like GDNative
functions don't have documentation. Godot itself doesn't have documentation for
these so there's not much to do there. They are quite intuitive to use though.
