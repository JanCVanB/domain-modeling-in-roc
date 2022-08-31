interface PaymentSystem
    exposes [CheckNumber, CardNumber, CardType, CreditCardInfo, PaymentMethod, PaymentAmount, Currency, Payment]
    imports []

CheckNumber : I16
CardNumber : Str

CardType : [Visa, Mastercard]
CreditCardInfo : {
    type: CardType,
    number: CardNumber,
}

PaymentMethod : [Cash, Check CheckNumber, Card CreditCardInfo]

PaymentAmount : Dec
Currency : [EUR, USD]

Payment : {
    amount: PaymentAmount,
    currency: Currency,
    method: PaymentMethod,
}
