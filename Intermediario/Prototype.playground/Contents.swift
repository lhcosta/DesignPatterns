import UIKit

//MARK:- Prototype
protocol Copying: AnyObject {
    init(_ prototype : Self)
}

//Default implementation 
extension Copying {
    
    public func copy() -> Self {
        return type(of: self).init(self)
    }
    
}

class Player : Copying {
    
    let name : String
    let age : Int
    
    
    public init(name : String, age : Int) {
        self.name = name
        self.age = age
    }
    
    required convenience init(_ prototype: Player) {
        self.init(name : prototype.name, age : prototype.age)
    }
}   

let player1 = Player(name: "Lucas", age: 20)
let player2 = player1.copy()


