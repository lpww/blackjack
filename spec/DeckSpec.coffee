assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 258
      hand.hit()
      assert.strictEqual deck.length, 257

  describe 'same deck', ->
    it 'should be using same deck', ->
      assert.strictEqual deck.length, 258
      hand.hit()
      assert.strictEqual deck.length, 257
      assert.strictEqual hand.length, 3
      hand.reset()
      hand.hit()
      hand.hit()
      assert.strictEqual hand.length, 2
      assert.strictEqual deck.length, 255
