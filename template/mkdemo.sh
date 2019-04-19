# This script generates a minimal demo using the stack template after updating it.

rm -rf demo
./update-template.sh
stack new demo ./godot-haskell.hsfiles

# Make template point to this local checkout of godot-haskell
# stack.yaml:
sed -i 's/git: .*/..\/..\//' demo/stack.yaml
sed -i '/  commit: .*/d' demo/stack.yaml
# shell.nix:
sed -i 's/.\/godot-haskell.nix {fetchFromGitHub = pkgs.fetchFromGitHub;};/..\/..\/. {};/' demo/shell.nix
