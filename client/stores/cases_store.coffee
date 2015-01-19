
class App.CasesStore extends Space.ui.Store

  Dependencies:
    cases: 'Cases'
    actions: 'Actions'

  setInitialState: -> {
    case: null
    cases: @cases.find()
  }

  configure: ->

    @listenTo(
      @actions.setCurrentCase, @_setCurrentCase
    )

  _setCurrentCase: (caseId) ->
    # alert 'caseId (' + caseId + ') is available in the store.'
    @setState 'case', @cases.findOne caseId
