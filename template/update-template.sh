# This script updates the template file with the revision and hash of the latest
# commit in origin/master or revision supplied as argument.

REV=$1
if [ -z $REV ]; then
    REV=$(git show origin/master | grep commit | head -n 1 | cut -d ' ' -f 2)
fi

SHA256=$(nix-prefetch-git https://github.com/SimulaVR/godot-haskell $REV --fetch-submodules | grep sha256 | cut -d '"' -f 4)

sed -i "s/commit: .*/commit: ${REV}/" godot-haskell.hsfiles
sed -i "s/rev = .*;/rev = \"${REV}\";/" godot-haskell.hsfiles
sed -i "s/sha256 = .*;/sha256 = \"${SHA256}\";/" godot-haskell.hsfiles
