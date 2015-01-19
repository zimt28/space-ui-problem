
class App.CasesShowMediator extends Space.ui.Mediator

  @Template: 'casesShow'

  Dependencies:
    store: 'CasesStore'

  templateHelpers: ->

    state: => {
      case: @store.getState().case
    }

  templateEvents: ->
    'click b': ->
      window.cases.update @case._id, $set: { name: @case.name + ' - Updated' }
