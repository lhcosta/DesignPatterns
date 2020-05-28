import UIKit

var str = "Hello, playground"

//Design Pattern - Singleton
class Database {
    
    /// Propriedade estática que contém a única instância da classe.
    static let standard = Database()
    
    /// Construtor privado
    private init(){}
    
}

//Using Closures
class Network {

    private init(){}
    
    private static let standard : Network = {
       return Network() 
    }()
   
    class func shared() -> Network {
        return self.standard
    }
    
}



