interface CardGame
    exposes [Suit, Rank, Card, Hand, Deck, Player, Game, Deal, PickupCard]
    imports []

Suit : [Club, Diamond, Spade, Heart]
Rank : [Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace]
Card : { suit : Suit, rank : Rank }

Hand : List Card
Deck : List Card

Player : { name : Str, hand : Hand }
Game : { deck : Deck, players : List Player }

Deal : Deck -> { deck : Deck, card : Card }
PickupCard : { hand : Hand, card : Card } -> Hand
