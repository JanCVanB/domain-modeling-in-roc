app "print_contact"
    packages { pf: "../../roc/examples/hello-world/platform/main.roc" }
    imports [Contact]
    provides [main] to pf

main = "My name is \(me.firstName) \(me.lastName).\n"

me : Contact.Contact
me = {
    firstName: "Jan",
    middleName: "C",
    lastName: "Van Bruggen",
    emailAddress: "JanCVanB@pm.me",
    isEmailVerified: True,
}
