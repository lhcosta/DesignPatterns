import UIKit

enum BaiaoDeDois {
    case arroz
    case feijao
    case queijo
}

//MARK:- Chain of responsibility
protocol Handler: AnyObject {
        
    //MARK:- Properties
    var nextHandler : Handler? { get set }
    
    //MARK:- Methods
    func setNext(handler : Handler) -> Handler
    func handle(request : BaiaoDeDois) -> BaiaoDeDois?
}

extension Handler {
    
    func setNext(handler : Handler) -> Handler {
        self.nextHandler = handler
        return handler
    }
    
    func handle(request : BaiaoDeDois) -> BaiaoDeDois? {
        return nextHandler?.handle(request: request)
    }
    
}

//MARK:- Concrete handler

class ArrozHandler : Handler {
    
    var nextHandler: Handler?
    
    func handle(request: BaiaoDeDois) -> BaiaoDeDois? {
        if request == .arroz {
            return .arroz
        }
        
        return nextHandler?.handle(request: request)
    }
}

class FeijaoHandler : Handler {
    
    var nextHandler: Handler?
    
    func handle(request: BaiaoDeDois) -> BaiaoDeDois? {
        if request == .feijao {
            return .feijao
        }
        
        return nextHandler?.handle(request: request)
    }
}

class QueijoHandler : Handler {
    
    var nextHandler: Handler?
    
    func handle(request: BaiaoDeDois) -> BaiaoDeDois? {
        if request == .queijo {
            return .queijo
        }
        
        return nextHandler?.handle(request: request)
    }
}

var arrozHandler = ArrozHandler()
var feijaoHandler = FeijaoHandler()
var queijoHandler = QueijoHandler()

arrozHandler.setNext(handler: feijaoHandler)
feijaoHandler.setNext(handler: queijoHandler)

let ingredientes : [BaiaoDeDois] = [.feijao, .queijo]

ingredientes.forEach({
    guard let result = arrozHandler.handle(request: $0) else {
        return
    }
    
    print(result)
})
