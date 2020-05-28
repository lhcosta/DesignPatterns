import UIKit

//MARK:- Iterator
struct Player {
    let name : String
}

struct Team {
    let players : [Player]
}

/// Iterator do time.
struct TeamIterator : IteratorProtocol {

    typealias Element = Player
    
    private let players : [Player]
    private var current = 0
    
    init(players : [Player]) {
        self.players = players
    }
    
    mutating func next() -> Player? {
        do { current += 1 }
        return players.count > current ? players[current] : nil
    }
}

extension Team : Sequence {
    
    __consuming func makeIterator() -> TeamIterator {
        return TeamIterator(players: players)
    }
    
}

let player1 = Player(name: "Lucas")
let player2 = Player(name: "Marcos")
let player3 = Player(name: "Thiago")

let team = Team(players: [player1, player2, player3])

team.players.forEach({
    print($0.name)
})
