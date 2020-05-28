import UIKit

//MARK:- Delegate Protocol
protocol MessageDelegate : AnyObject {
    
    /// Apresentando mensagem
    /// - Parameter message: mensagem.
    func show(message : String)

}


class Sender {
    
    weak var delegate : MessageDelegate?
    
    func send() {
        delegate?.show(message: "Dados para o delegado")
    }
    
}

class Receiver : MessageDelegate {
    
    func show(message: String) {
        print(message)
    }

}


let sender = Sender()
let receiver = Receiver()

//Definindo o responsável por receber os dados ou realizar uma tarefa
sender.delegate = receiver

sender.send()
