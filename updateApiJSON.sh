# For dev purposes only
cd classgen
godot-haskell-classgen ../../godot/bin/api.json
cd ..
cp -r src src.bak
rsync -a classgen/src/ src/

