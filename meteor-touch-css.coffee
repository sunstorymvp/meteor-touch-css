Meteor.startup ->
  unless "createTouch" of document then return

  try
    [].forEach.call document.styleSheets, (stylesheet) ->
      if stylesheet.ownerNode.classList.contains("__meteor-css__") and stylesheet.cssRules
        hoverRulesIndices = [].reduce.call stylesheet.cssRules, (result, rule, index) ->
          if /:hover/.test(rule.cssText) then result.push index
          result
        , []

        # reversing rules order, because removing of a rule affects on
        # indices in stylesheet.cssRules object
        hoverRulesIndices.reverse().forEach (hoverRuleIndex) ->
          stylesheet.deleteRule hoverRuleIndex

  catch error
    console.error "failed to remove :hover style rules", error
