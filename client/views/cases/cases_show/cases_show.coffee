
Template.casesShow.helpers
  caseFromHelpers: ->
    window.cases.findOne Router.current().params._id
