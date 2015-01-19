
class App.Application extends Space.Application

  RequiredModules: ['Space.ui']

  Dependencies:
    templateMediatorMap: 'Space.ui.TemplateMediatorMap'
    actionFactory: 'Space.ui.ActionFactory'

  configure: ->

    # ACTIONS
    @injector.map('Actions').toStaticValue @actionFactory.create [
      'setCurrentCase'
    ]

    window.cases = new Mongo.Collection()

    window.cases.insert name: 'Case 1', note: 'Click one case, then go back'
    window.cases.insert name: 'Case 2', note: 'Then open the same case again, or another one'
    window.cases.insert name: 'Case 3', note: 'It will work then'
    window.cases.insert name: 'Case 4', note: 'If you keep one case open and refresh, it won \'t work as well - unless you go back and open another document or the same document again'

    # DATA + LOGIC
    @injector.map('Cases').toStaticValue window.cases
    @injector.map('CasesStore').toSingleton App.CasesStore

    # ROUTING WITH IRON-ROUTER
    @injector.map('Router').toStaticValue Router
    @injector.map('CasesIndexController').toSingleton App.CasesIndexController
    @injector.map('CasesShowController').toSingleton App.CasesShowController

    # TEMPLATE MEDIATORS
    @templateMediatorMap.autoMap 'CasesIndexMediator', App.CasesIndexMediator
    @templateMediatorMap.autoMap 'CasesShowMediator', App.CasesShowMediator

  run: ->
    @injector.create 'CasesStore'
    @injector.create 'CasesIndexController'
    @injector.create 'CasesShowController'

Meteor.startup -> new App.Application().run()
