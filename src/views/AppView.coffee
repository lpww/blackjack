class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button>
    <button class="stand-button">Stand</button>
    <button class="new-game-button">New Game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .new-game-button': -> @model.newGame()

  initialize: ->
    @render()
    @model.get('playerHand').on 'add remove change', => @render()
    @model.get('dealerHand').on 'add remove change', => @render()


  render: ->
    @$el.children().detach()
    @$el.html @template()
    if @model.get('playerHand').scores()[0] > 21
      $('.hit-button').css 'display', 'none'
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
