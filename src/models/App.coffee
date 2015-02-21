# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    #these models are inst. in the Deck
    @set 'playerHand', deck.dealPlayer()
    #these models are inst. in the Deck
    @set 'dealerHand', deck.dealDealer()

    #playerHand stands
    @get('playerHand').on 'stand', (->
      @get('dealerHand').models[0].flip()
      @dealerGame()
    ), this

    @.on 'endRound', (->
      @dealerGame()
    ), this

    #dealerHand stand
    @get('dealerHand').on 'stand', (->
      console.log 'hey there'
    ), this

  dealerGame : ->
    if @get('dealerHand').scores()[0] <= 21
      if @get('dealerHand').scores()[0] < 17
        @get('dealerHand').hit()
        @trigger 'endRound'
      else
        console.log "dealer stands"
    else
      console.log "dealer bust's a nut"

###
  Player Reset
    - create an event on the view for new Game
    - create a trigger that if event click was set - to reset game
      - to set('dealerHand', deck.dealPlayer())
      - to set('playerHand', deck.playerHandPlayer())

  Dealer Stands - Calculate who won
    // Put winning score in Green

  Redesign and Hopefully Chips


###
