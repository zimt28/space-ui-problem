
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
    @setState 'case', @cases.findOne caseId
