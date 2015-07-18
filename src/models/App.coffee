# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'hit', =>
      if @get('playerHand').minScore() > 21
        alert('player busted, dealer wins')

    @get('playerHand').on 'stand', =>
      @get('dealerHand').first().flip()
      while @get('dealerHand').minScore() < 17
        @get('dealerHand').hit()
      @get('dealerHand').stand()

    @get('dealerHand').on 'stand', =>
      if @get('dealerHand').minScore() > 21
        alert('dealer busted')
      if @get('playerHand').minScore() > 21
        alert('player busted')  


      # check if player is busted after every hit
      # if dealer over 21, dealer busts, player wins
      # if player over 21, player busts, dealer wins
      # else
      #   get max val under 21 for each
      #     compare and display winner based on max val  



    # eventually generalize:
    @get('playerHand').on 'busted', =>
      # delete the hit button by modifying the app view
      @get('playerHand').isBusted
      alert 'player busted'

    @get('dealerHand').on 'busted', =>
      # delete the hit button by modifying the app view
      @get('dealerHand').isBusted  


  #    $this).find('.handle').show() / .hide()

