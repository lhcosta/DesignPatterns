import UIKit

//MARK:- STRATEGY
enum Calculator {
    case sum
    case subtraction
    case multiplier
    case divide
}

//Strategy protocol
protocol CalculatorStrategy {
    func calculate(_ lhs: Int, _ rhs: Int) -> Any
}

//Strategy classes
struct SumStrategy : CalculatorStrategy {
    func calculate(_ lhs: Int, _ rhs: Int) -> Any {
        return lhs + rhs
    }
}

struct MultiplierStrategy : CalculatorStrategy {
    func calculate(_ lhs: Int, _ rhs: Int) -> Any {
        return lhs * rhs
    }
}

struct DivideStrategy : CalculatorStrategy {
    func calculate(_ lhs: Int, _ rhs: Int) -> Any {
        return lhs/rhs
    }
}

struct SubtractionStrategy : CalculatorStrategy {
    func calculate(_ lhs: Int, _ rhs: Int) -> Any {
        return lhs - rhs
    }
}

//Context Class
class Context {
    
    //MARK:- Refenrencia para uma estratégia
    private var strategy : CalculatorStrategy
    
    /// Propriedade que manipula a estratégia
    var currentStrategy : CalculatorStrategy {
        set {
            self.strategy = newValue
        }
        
        get {
            return strategy
        }
    }
    
    /// Inicializada com a estratégia de soma.
    init() {
        self.strategy = SumStrategy()
    }
    
    /// Executando calculadora.
    /// - Parameters:
    ///   - a: primeiro número
    ///   - b: segundo número
    func execute(_ a : Int, _ b : Int) -> Any {
        return self.strategy.calculate(a, b)
    }
}


let type : Calculator = .divide
let context = Context()

switch type {
    case .sum:
        context.currentStrategy = SumStrategy()
    case .divide:
        context.currentStrategy = DivideStrategy()
    case .multiplier:
        context.currentStrategy = MultiplierStrategy()
    case .subtraction:
        context.currentStrategy = SubtractionStrategy()
}

context.execute(10, 10)


