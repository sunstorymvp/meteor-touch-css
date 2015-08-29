Meteor.startup(function() {
  if ("createTouch" in document) {
    try {
      [].forEach.call(document.styleSheets, function(stylesheet) {
        var hoverRules = [];
        if (stylesheet.ownerNode.classList.contains('__meteor-css__') && stylesheet.cssRules) {
          [].forEach.call(stylesheet.cssRules, function(rule, index) {
            if (rule.selectorText && /:hover/.test(rule.selectorText) && rule.type === CSSRule.STYLE_RULE) {
              hoverRules.push(index);
            }
          });
          // reversing rules order, because removing a rule affects 
          // indexes at stylesheet.cssRules object
          hoverRules.reverse().forEach(function(hoverRuleIndex) {
            stylesheet.deleteRule(hoverRuleIndex);
          });
        }
      });
    } catch (error) {
      console.error('failed to remove :hover style rules', error);
    }
  }
});
