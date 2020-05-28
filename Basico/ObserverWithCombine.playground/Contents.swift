import UIKit
import Combine

//MARK:- Observer

class Player {
    
    @Published var name : String
    
    init(name : String) {
        self.name = name
    }
}

let player = Player(name: "Lucas")
let publisher = player.$name
var subscriber : AnyCancellable? = publisher.sink() {
    print("Player name is \($0)")
}
