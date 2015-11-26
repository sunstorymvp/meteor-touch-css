# meteor-touch-css
Remove `:hover` style rules on touch devices.

This package runs only on `client`.

It iterates over `document.styleSheets`, finds that its `ownerNode` (link tag)
contains class `__meteor-css__` and then removes all `:hover` style rules found.

It takes about 35ms to remove 100 `:hover` rules on ipad 4.

**Important:** Note that it also removes the complex style rules 
that selectors contain `:hover`, for example:

```css
a:hover,
a:focus {
  color: blue
}
```

### Install

`meteor add sunstory:meteor-touch-css`

### Issues

If you change your css file during development and live update appears,
it leads to updating CSSOM by browser with a new stylesheet.
You will need to refresh page manually to rerun script.

### Changelog

* **26 Nov 2015**: Bugfix: remove ONLY `:hover` rules declared inside media queries.
* **21 Nov 2015**: Remove `:hover` rules declared inside media queries.
