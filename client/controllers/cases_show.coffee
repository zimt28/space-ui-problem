
class App.CasesShowController

  Dependencies:
    actions: 'Actions'
    tracker: 'Tracker'
    router: 'Router'

  onDependenciesReady: ->

    self = this

    @router.route 'cases.show',
      path: 'show/:_id'

      onBeforeAction: ->
        caseId = @params._id
        # alert 'caseId (' + caseId + ') is available in the controller.'

        self.tracker.nonreactive -> self._setCurrentCase caseId

  _setCurrentCase: (caseId) ->
    @actions.setCurrentCase caseId
