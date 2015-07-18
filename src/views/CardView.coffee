class window.CardView extends Backbone.View
  className: 'card'

  #template: _.template '<%= rankName %> of <%= suitName %>'
  template: _.template '<img src="img/cards/<%=rankName%>-<%=suitName%>.png"></img>'
  template2: _.template '<img src="img/card-back.png"></img>'

  # upper case
  # path

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' and @$el.html @template2 @model.attributes unless @model.get 'revealed'

