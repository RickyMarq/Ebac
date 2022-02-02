import UIKit

// 1) Qual das seguintes atribuição são válidas?
var name: String? = "Carlos"
// var age: Int = nil
let kilometer: Float = 26.7
var lastName: String? = nil

print("As atribuições name, Kilometer e LastName são válidas.")

// Ambas as 3 são válidas, levei o exercício meio a ferro e fogo e não percebi que a name e LastName são válidas mesmo sendo respectivamente any e nil

// 2) - Faça o unwrap com segurança com a constante, `number` e print com a condição mais legível.

var numericalString = "3"
var number = Int(numericalString)

if let number = number {
    print("A constante é \(number)")
} else {
    print("A constante é nula/vazia :(")
}

// 3) - Se alteramos o valor da variavel numericalString para "cinco" e executar o playground, o que acontecerá?
// a - Vai funcionar sem problemas (✓)
// b - Não vai funcionar (x)
// c - acredito que não funcione. (x)

// Alternativa A

// Irá rodar sem problemas pois ao fazer um unwrap seguro descobrimos que irá existir um nil

// 4) - A classe UIViewController possui uma propriedade chamada tabBarController. A propriedade tabBarController é optinal do tipo `UITabBarController?`.
//O próprio tabBarController contém um tabBar como propriedade.
//Complete o código abaixo preenchendo com o uso apropriado do optional chaining para acessar a propriedade `tabBar`.

var viewController = UIViewController()

if let tabBar = viewController.tabBarController?.tabBar {
    print("Aqui tem uma tabBar controller.")
} else {
    print("Aqui não tem uma tabBar controller.")
}


// Percebi os meu erros, fiquei tanto tempo quebrando a cabeça no 4 que não dei a devida atenção aos anteriores. Muito Obrigado Gabriela :)

