class window.Card extends Backbone.Model
  # params is receiving from the Deck as of Card Object.
  initialize: (params) ->
    #this.set()
    @set
      # revaled is true;
      revealed: true
      ###
        Value is dictated math.
        First we will look at the card number is greater than 10
        if greater than 10 it will do its course of rank and suit
          depending on index and rank determined modulus.
      ###
      value: if !params.rank or 10 < params.rank then 10 else params.rank
      suitName: ['Spades', 'Diamonds', 'Clubs', 'Hearts'][params.suit]
      rankName: switch params.rank
        when 0 then 'King'
        when 1 then 'Ace'
        when 11 then 'Jack'
        when 12 then 'Queen'
          #this just get number value
        else params.rank
  # flip method inside Card model
  flip: ->
    #this.set('revealed', !this.get 'revealed');
      # this is a toggle.
    @set 'revealed', !@get 'revealed'
    @

