import UIKit

//MARK:- Factory
enum AnimalType {
    case dog
    case cat
}

protocol Animal {
    
    var name : String {get set}
    
    func sleep()
    func eat()
    
}

///Product 
struct Dog : Animal {
    
    var name: String
    
    func sleep() {
        print("Dog sleeping")
    }
    
    func eat() {
        print("Dog eating")
    }
}

//Product
struct Cat : Animal {
    
    var name: String
    
    func sleep() {
        print("Cat sleeping")
    }
    
    func eat() {
        print("Cat eating")
    }
}

struct AnimalFactory {
    
    static func createAnimal(type : AnimalType, name : String) -> Animal {
        switch type {
        case .dog:
            return Dog(name: name)
        case .cat:
            return Dog(name: name)
        }
    }
    
}

let animal = AnimalFactory.createAnimal(type: .cat, name: "Carlos")
