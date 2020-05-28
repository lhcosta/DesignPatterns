import UIKit

//MARK:- MulticastDelegate

class MulticastDelegate<ProtocolType> {
    
    private class DelegateWrapper {
        
        weak var delegate : AnyObject?
        
        init(_ delegate : AnyObject) {
            self.delegate = delegate
        }
    }  
    
    /// Wrappers
    private var delegateWrappers : [DelegateWrapper]
    
    /// Delegates
    var delegates : [ProtocolType] {
        
        return delegateWrappers.compactMap {
            return $0.delegate as? ProtocolType
        }
    } 
    
    //Iniciando o tipo do protocolo especificado e convertendo para delegate wrapper
    init(delegates: [ProtocolType] = []) {
        self.delegateWrappers = delegates.map {
            DelegateWrapper($0 as AnyObject)
        }
    }
    
    /// Adicionando um novo delegate.
    /// - Parameter delegate: delegate específico
    func addDelegate(_ delegate : ProtocolType) {
        let wrapper = DelegateWrapper(delegate as AnyObject)
        self.delegateWrappers.append(wrapper)
    }
    
    func removeDelegate(_ delegate : ProtocolType) {
        
        self.delegateWrappers.removeAll(where: {
            return $0.delegate === delegate as AnyObject
        })
    }
}


//MARK:- Delegate
protocol PlayerDelegate : AnyObject {
    func play()
    func stop()
}

//MARK:- Concrete Class
class SoccerPlayer : PlayerDelegate {
    
    func play() {
        print("O jogador de futebol começou a jogar")
    }
    
    func stop() {
        print("O jogador de futebol parou de jogar")
    }
    
}

class VolleyballPlayer : PlayerDelegate {
    
    func play() {
        print("O jogador de volei começou a jogar")
    }
    
    func stop() {
        print("O jogador de volei parou de jogar")
    }
}

class Coach {
    
    var multicastDelegate : MulticastDelegate<PlayerDelegate>?
    
    init() {
        self.multicastDelegate = MulticastDelegate()
    }
    
    func startPlay() {
        multicastDelegate?.delegates.forEach({
            $0.play()
        })
    }
    
    
}


//MARK:- Teste
let soccerPlayer = SoccerPlayer()
let volleyballPlayer = VolleyballPlayer()

let coach = Coach()
coach.multicastDelegate?.addDelegate(soccerPlayer)
coach.multicastDelegate?.addDelegate(volleyballPlayer)

coach.startPlay()
