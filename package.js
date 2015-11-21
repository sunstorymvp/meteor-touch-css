Package.describe({
  name: 'sunstory:meteor-touch-css',
  summary: 'Remove :hover style rules on touch devices.',
  version: '1.0.2',
  git: 'https://github.com/sunstorymvp/meteor-touch-css.git'
});

Package.onUse(function(api) {
  api.use('coffeescript');
  api.addFiles('meteor-touch-css.coffee', 'client');
});
