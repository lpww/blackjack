class window.Hand extends Backbone.Collection
  #this collection is relative to Card Model
  model: Card

  #initialize (array, this.deck, this.isDealer)
    #this has been given us from Deck model
  initialize: (array, @deck, @isDealer) ->
    #array is first two cards, with one hidden if dealer
    #this.deck is ths this binding to Deck
    #this.isDealer is set to True if dealer. - Deck Model
      #this.isDealer isn't set for player  - Deck Model

  #this is a method for hand
  hit: ->
    #this.add() - basically adds a card from the deck to the hand.
    if @scores()[0] < 21
      @push(@deck.pop())
    # return @

  hasAce: -> @reduce (memo, card) ->
    #this will be a reduce function
    #return memo || card.get('value') === 1
      # FIND WHAT MEMO IS.
    memo or card.get('value') is 1
  , 0
  # min score is a reduce function(score, card)
    # score + if(card.get('revealed')) { then card.get('value'); else 0
    # WHAT IS SCORE?
  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

    #this.minScore(), #this.minScore() +10 * @hasAce()]

  stand: ->
    @trigger 'stand'

# create a stand method
