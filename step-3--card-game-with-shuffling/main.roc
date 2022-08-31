app "play_cards"
    packages { pf: "../../roc/examples/hello-world/platform/main.roc" }
    imports [CardGame]
    provides [main] to pf

main =
    deck = myDeck
    shuffledDeck = shuffle deck
    { card } = dealMe shuffledDeck
    rank = stringifyRank card.rank
    suit = stringifySuit card.suit

    "My card is the \(rank) of \(suit)!\n"

myDeck : CardGame.Deck
myDeck = [
    { rank: Ace, suit: Club },
    { rank: Ace, suit: Diamond },
    { rank: Ace, suit: Heart },
    { rank: Ace, suit: Spade },
]

shuffle : CardGame.Shuffle
shuffle = \deck -> List.reverse deck # lol

dealMe : CardGame.Deal
dealMe = \shuffledDeck -> {
    shuffledDeck: List.dropFirst shuffledDeck,
    card: List.get shuffledDeck 0 |> Result.withDefault { rank: Two, suit: Club },
}

stringifyRank = \rank ->
    when rank is
        Ace -> "Ace"
        King -> "King"
        Queen -> "Queen"
        Jack -> "Jack"
        Ten -> "10"
        Nine -> "9"
        Eight -> "8"
        Seven -> "7"
        Six -> "6"
        Five -> "5"
        Four -> "4"
        Three -> "3"
        Two -> "2"

stringifySuit = \suit ->
    when suit is
        Club -> "Clubs"
        Diamond -> "Diamonds"
        Heart -> "Hearts"
        Spade -> "Spades"
