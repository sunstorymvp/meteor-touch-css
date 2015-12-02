Meteor.startup ->
  unless document.createTouch then return

  removeHoverRules = (stylesheet) ->
    indices = getHoverRulesIndices stylesheet.cssRules
    # reversing rules order, because removing of a rule affects on
    # indices in cssRules object
    indices.reverse().forEach (index) -> stylesheet.deleteRule index

  getHoverRulesIndices = (cssRules) ->
    [].reduce.call cssRules, (result, rule, index) ->
      if rule.type == CSSRule.MEDIA_RULE and rule.cssRules
        removeHoverRules(rule)
      else if rule.type == CSSRule.STYLE_RULE and /:hover/.test(rule.cssText)
        result.push index
      result
    , []

  [].forEach.call document.styleSheets, (stylesheet) ->
    if stylesheet.ownerNode.classList.contains("__meteor-css__")
      removeHoverRules stylesheet
