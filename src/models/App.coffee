# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'stand', =>
      @get('dealerHand').first().flip()
      if @get('dealerHand').minScore() < 17
        @get('dealerHand').hit()

    # eventually generalize:
    # @get('playerHand').on 'busted', =>
      # delete the hit button by modifying the app view



      # $this).find('.handle').show() / .hide()

