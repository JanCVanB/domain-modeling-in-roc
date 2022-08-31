app "pay_someone"
    packages { pf: "../../roc/examples/hello-world/platform/main.roc" }
    imports [PaymentSystem]
    provides [main] to pf

main = stringify myPayment

myPayment : PaymentSystem.Payment
myPayment = {
    amount: 1234,
    currency: USD,
    method: Card {type: Visa, number: "1234567890123456"},
}

Stringify is
    ...

stringify = \payment ->
    amount =
        a = Num.toStr payment.amount
        when payment.currency is
            EUR -> "€\(a)"
            USD -> "$\(a)"
    method =
        when payment.method is
            Card _ -> "credit card!!!"
            Cash -> "cash"
            Check _ -> "check!!!"
            #Card {number} -> "credit card \(number)"
            #Check number -> Num.toStr number |> (\s -> "check \(s)")
    "I paid someone \(amount) via \(method).\n"
