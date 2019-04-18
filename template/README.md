# Template and project demo

## Updating the demo:

./mkdemo.sh

This will update the template and recreate the demo. The demo will have all
references to godot-haskell **redirected to the local checkout** so as not to
require another compilation.

## Updating the template file

./update-template.sh

This script updates the template file with the revision and hash of the latest
commit in origin/master or revision supplied as argument.

## Using the template

```
stack new myproject templatefile
```

`templatefile` is path to `godot-haskell.hsfiles`, either locally or as a link.
