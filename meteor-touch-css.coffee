Meteor.startup ->
  unless "createTouch" of document then return

  removeHoverRules = (stylesheet, indices) ->
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

  try
    [].forEach.call document.styleSheets, (stylesheet) ->
      if stylesheet.ownerNode.classList.contains("__meteor-css__") 
        removeHoverRules stylesheet

  catch error
    console.error "failed to remove :hover style rules", error
