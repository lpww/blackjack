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

    @get('playerHand').on 'checkHand', (->
      @playerHit()
    ), this

  dealerGame : ->
    if @get('dealerHand').scores()[0] <= 21
      if @get('dealerHand').scores()[0] < 17
        @get('dealerHand').hit()
        @trigger 'endRound'
      else
        @endGame()
    else
      @endGame()

  newGame : ->
    #playerHand reset for newGame
    @get('playerHand').reset()
    @get('playerHand').hit()
    @get('playerHand').hit()
    # @get('playerHand').hit()
    #dealerHand reset for newGame
    @get('dealerHand').reset()
    @get('dealerHand').hit()
    @get('dealerHand').models[0].flip()
    @get('dealerHand').hit()

    # console.log @get('deck').length

  playerHit : ->
     if @get('playerHand').scores()[0] > 21
      alert 'you lose!'

  endGame : ->
    # check both the DealerHand.score and playerHand Score
    # if dealerScore has 21 or is greater than PlayerHand Score
      #dealer wins
    # else if playerScore is 21 or is greater than dealerScore
      #playerWins
    if @get('dealerHand').scores()[0] > 21
      alert 'you win!'
    else if @get('playerHand').scores()[0] <= 21 and @get('dealerHand').scores()[0] < @get('playerHand').scores()[0]
      alert 'player wins!'
    else if @get('playerHand').scores()[0] <= 21 and @get('dealerHand').scores()[0] > @get('playerHand').scores()[0]
      alert 'dealer wins!'
    else
      alert 'draw... wtf?!'
###

  Dealer Stands - Calculate who won
    // Put winning score in Green

  Redesign and Hopefully Chips


###
