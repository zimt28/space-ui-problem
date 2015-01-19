
class App.CasesIndexController

  Dependencies:
    router: 'Router'
    session: 'Session'

  onDependenciesReady: ->

    @router.route 'cases.index',
      path: '/'
