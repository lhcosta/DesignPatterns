import UIKit

//MEDIATOR PROTOCOL
protocol Direction {
    associatedtype MessageType
    
    var teachers : [Teacher] { get set }
    
    mutating func add(teacher : Teacher)
    
    func send(message : MessageType)
    
}

//COLLEAGUE PROTOCOL
protocol Receiver {
    associatedtype Message
    func receive(message : Message)
}

//COLLEAGUE
struct Teacher : Receiver {
    typealias Message = String
    
    internal let name : String
    
    func receive(message: String) {
        print("Teacher - \(name) receive \(message).")
    }
}

//MEDIATOR
struct Mediator : Direction {    

    typealias MessageType = String
    
    internal var teachers: [Teacher] = []
    
    mutating func add(teacher: Teacher) {
        self.teachers.append(teacher)
    }
    
    func send(message: String) {
        self.teachers.forEach({
            $0.receive(message: message)
        })
    }
}

var mediator = Mediator()
let jose = Teacher(name: "Jose")
let carlos = Teacher(name: "Carlos")

mediator.add(teacher: jose)
mediator.add(teacher: carlos)

mediator.send(message: "Carnaval pra quem ?")
