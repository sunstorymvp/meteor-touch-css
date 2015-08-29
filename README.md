# meteor-touch-css
Remove `:hover` style rules on touch devices.

This package runs only on `client`.

It iterates over `document.styleSheets`, find's that it's `ownerNode` (link tag)
contains class `__meteor-css__` and then removes all `:hover` style rules found.

It takes about 35ms to remove 100 `:hover` rules on ipad 4.

### Issues

In development if you change your css file and live update appears, 
it leads to updating CSSOM by browser with a new stylesheet.
You will need to refresh page manually to rerun script.
