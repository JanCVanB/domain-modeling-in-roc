app "interview_A"
    packages { pf: "../../roc/examples/hello-world/platform/main.roc" }
    imports []
    provides [main] to pf

main =
    interviewer = Cat { name: "Allie" }
    interviewee = Dog { name: "Bobby" }
    question = ask { interviewer, interviewee }
    answer = reply { interviewee, interviewer }
    "Interview transcript:\n    \(question)\n    \(answer)\n"

ask = \{interviewee, interviewer} ->
    speaker = formatName interviewer
    audience = formatName interviewee
    "Hello, my name is \(speaker). It's nice to meet you, \(audience)!"

formatName = \thing ->
    when thing is
        Cat {name} -> "The Feline Known As \(name)"
        Dog {name} -> "Good Old \(name)"
        _ -> "Unknown Mysterious Thing"

reply = \{interviewee} ->
    audience = formatName interviewer
    "It's nice to meet you too, \(interviewer)!"

