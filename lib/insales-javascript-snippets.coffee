InsalesJavascriptSnippetsView = require './insales-javascript-snippets-view'
{CompositeDisposable} = require 'atom'

module.exports = InsalesJavascriptSnippets =
  insalesJavascriptSnippetsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @InsalesJavascriptSnippetsView = new InsalesJavascriptSnippetsView(state.insalesJavascriptSnippetsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @insalesJavascriptSnippetsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'insales-javascript-snippets:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @insalesJavascriptSnippetsView.destroy()

  serialize: ->
    insalesJavascriptSnippetsViewState: @insalesJavascriptSnippetsView.serialize()

  toggle: ->
    console.log 'InsalesJavascriptSnippets was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
