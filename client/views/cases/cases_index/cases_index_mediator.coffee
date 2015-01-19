class App.CasesIndexMediator extends Space.ui.Mediator

  @Template: 'casesIndex'

  Dependencies:
    store: 'CasesStore'
    router: 'Router'

  templateHelpers: ->
    state: => {
      cases: @store.getState().cases
    }

  templateEvents: ->
    self = this

    click: ->
      self.router.go '/show/' + @_id
