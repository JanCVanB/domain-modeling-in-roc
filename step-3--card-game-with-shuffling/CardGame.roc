interface CardGame
    exposes [Suit, Rank, Card, Hand, Deck, Player, Game, Deal, ShuffledDeck, Shuffle, PickupCard]
    imports []

Suit : [Club, Diamond, Spade, Heart]
Rank : [Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace]
Card : { suit : Suit, rank : Rank }

Hand : List Card
Deck : List Card

Player : { name : Str, hand : Hand }
Game : { deck : Deck, players : List Player }

Deal : ShuffledDeck -> { shuffledDeck : ShuffledDeck, card : Card }
ShuffledDeck : List Card
Shuffle : Deck -> ShuffledDeck
PickupCard : { hand : Hand, card : Card } -> Hand
