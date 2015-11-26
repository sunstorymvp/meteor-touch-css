Package.describe({
  name: 'sunstory:meteor-touch-css',
  summary: 'Remove :hover style rules on touch devices.',
  version: '1.0.3',
  git: 'https://github.com/sunstorymvp/meteor-touch-css.git'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1.0.3');
  api.use('coffeescript');
  api.addFiles('meteor-touch-css.coffee', 'client');
});
