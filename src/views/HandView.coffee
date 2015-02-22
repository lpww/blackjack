class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    # listening on collection.on(add, remove, change, this.render)
      # this renders
    @collection.on 'add remove change', => @render()
    @render()


  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    if @collection.scores()[0] > 21
      @$('h2').css 'color', 'red'
    @$('.score').text @collection.scores()[0]

