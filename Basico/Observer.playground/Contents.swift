import UIKit

enum Sport {
    case soccer
    case basketball
    case volleyball
}

//MARK:- OBSERVER

//INTERFACE - SUBSCRIBER
protocol Playable {
    
    /// Começar a jogar.
    /// - Parameter sport: esportes a serem notificados.
    func play(sports : [Sport])
}

//CONCRETE - SUBSCRIBERS
struct SoccerPlayer : Playable {
    
    func play(sports : [Sport]) {
        if sports.contains(.soccer) {
            print("Soccer player will go play")
        }
    }
}

struct BasketballPlayer : Playable {
    
    func play(sports : [Sport]) {
        if sports.contains(.basketball) {
            print("Basketball player will go play")
        }
    }
}

struct VolleyballPlayer : Playable {
    
    func play(sports : [Sport]) {
        if sports.contains(.volleyball) {
            print("Volleyball player will go play")
        }
    }
}

//PUBLISHER 
struct Publisher {
    
    private var subscribers : [Playable] = []
    private let sports : [Sport] = [.soccer, .basketball]
    
    /// Adicionado um novo subscriber.
    /// - Parameter player: jogador.
    mutating func addSubcriber(player : Playable) {
        subscribers.append(player)
    }
    
    /// Adicionado novos subscriber.
    /// - Parameter player: jogadores
    mutating func addSubcribers(players : [Playable]) {
        subscribers.append(contentsOf: players)
    }
    
    /// Removendo o último subscriber.
    mutating func removeLastSubscriber() {
        subscribers.removeLast()
    }
    
    /// Notificando os subscribers.
    func notifyPlayers() {
        self.subscribers.forEach { (player) in
            player.play(sports: sports)
        }
    }
}

let soccerPlayer = SoccerPlayer()
let volleyballPlayer = VolleyballPlayer()
let basketballPlayer = BasketballPlayer()

var publisher = Publisher()
publisher.addSubcribers(players: [soccerPlayer, volleyballPlayer, basketballPlayer])
publisher.notifyPlayers()


