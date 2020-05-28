import UIKit

//MARK:- Adapter
protocol Bank {
    func converterMoney() -> Double
}

/// Classe para ser adaptada
struct BankBR {
    let real : Double = 1.0
}

struct BankUS : Bank {

    var adaptee : BankBR
    
    func converterMoney() -> Double {
        return adaptee.real * 4.2 
    }
    
}

let bankBR = BankBR()
let bankUS = BankUS(adaptee: bankBR)

bankUS.converterMoney()
