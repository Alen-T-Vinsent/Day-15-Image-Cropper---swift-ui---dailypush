import Foundation


//let array = ["Apples", "Peaches", "Plums"]
//
//for (index, item) in array.enumerated() {
//    print("Found \(item) at position \(index)")
//}
var greetings = "Hello playgrounds"
let greet = {
    print("Hello world")
}
greet()

let properGreeting = { (name:String) in
    print("Hello \(name)")
}

properGreeting("alen")

let realGreeting = {(name:String)->(String) in
    let message = "real greeting \(name)"
    return message
}

let message = realGreeting("aron")
print(message)

let ytGreeting = {()->(String) in
    let message = "real greeting without input for learning"
    return message
}

let x = ytGreeting()
print(x)

func fetch(completion:@escaping (_ data:[String]) -> Void){
    let someFakeData = ["11","22","33"]
    DispatchQueue.main.asyncAfter(deadline: .now()+2){
        completion(someFakeData)
    }
}

print("i am before fetch")

fetch { data in
    print(data)
}

print("i am after fetch ")
