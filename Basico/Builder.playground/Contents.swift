//MARK:- Builder

enum TipoPizza {
    case salgada
    case doce
}

//PRODUCT
struct Pizza {
    var calabresa : Int = 0
    var queijo : Int = 0
    var tipo : TipoPizza?
    var borda : Bool = false
    var oregano : Int = 0
    var catupiry : Int = 0
}

//BUILDER 
protocol Builder {
    
    func addCalabresa(_ quantidade : Int)
    func addQueijo(_ quantidade : Int)
    func addTipo(_ tipo : TipoPizza)
    func addBorda(_ adicionar : Bool)
    func addOregano(_ quantidade : Int)
    func addCatupiry(_ quantidade : Int)
    func assarPizza() -> Pizza
    
}

//CONCRETE BUILDER
class PizzaBuilder : Builder {
 
    private var pizza = Pizza()
    
    func addCalabresa(_ quantidade: Int) {
        pizza.calabresa = quantidade
    }
    
    func addQueijo(_ quantidade: Int) {
        pizza.queijo = quantidade
    }
    
    func addTipo(_ tipo: TipoPizza) {
        pizza.tipo = tipo
    }
    
    func addBorda(_ adicionar: Bool) {
        pizza.borda = adicionar
    }
    
    func addOregano(_ quantidade: Int) {
        pizza.oregano = quantidade  
    }
    
    func addCatupiry(_ quantidade: Int) {
        pizza.catupiry = quantidade
    }
    
    func assarPizza() -> Pizza {
        defer { pizza = Pizza() }
        return pizza
    }
}

//DIRECTOR
class Chief {
    
    private var pizzaBuilder : PizzaBuilder
    
    init(pizzaBuilder : PizzaBuilder) {
        self.pizzaBuilder = pizzaBuilder
    }
    
    func criarPizzaCalabresa() -> Pizza {
        pizzaBuilder.addCalabresa(10)
        pizzaBuilder.addQueijo(2)
        pizzaBuilder.addOregano(10)
        pizzaBuilder.addTipo(.salgada)
        pizzaBuilder.addBorda(true)
        return pizzaBuilder.assarPizza()
    }
    
    func criarPizzaDoce() -> Pizza {
        pizzaBuilder.addTipo(.doce)
        pizzaBuilder.addBorda(true)
        return pizzaBuilder.assarPizza()
    }
    
    func criarPizzaCatupiry() -> Pizza {
        pizzaBuilder.addCatupiry(20)
        pizzaBuilder.addQueijo(20)
        pizzaBuilder.addBorda(true)
        pizzaBuilder.addTipo(.salgada)
        return pizzaBuilder.assarPizza()
    }
}

let pizzaBuilder = PizzaBuilder()
let chief = Chief(pizzaBuilder: pizzaBuilder)

let pizzaDoce = chief.criarPizzaDoce()
let pizzaCalabresa = chief.criarPizzaCalabresa()

