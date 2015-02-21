class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    # this.add = range of numbers from 0 - 512
    # the cards will shuffle
    # the returned value will be placed in a map function
      # then passed into a function with the card parameter
      # passed into a new CARD MODEL
        # rank will be determined by remainder of number divided by 13
        # the suit will be determined by the lower faction number divided 13
          # NOTE: ALL THIS MATH WILL OCCUR IN THE CARD MODEL.
    @add _([0...260]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 65)
  # dealPlayer - new Hand model.
    # this.pop twice (for first two cards)
      # pop() is a backbone function to get last value of deck
    # passing this reference to the deck
  dealPlayer: -> new Hand [@pop(), @pop()], @
  # dealDealer - new Hand Model
    #this.pop. to get first card
      #this.flip() which is coming from Card Model
      #returns false - hidden
    #this.pop for second card
      # passing this as a reference to the deck
  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true


