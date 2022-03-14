import UIKit

// 1) - Qual o tipo de x, e o que será printado referente ao valor x? var language = "Objc"

//let code = { [language] in print(language) }

//language = "Swift"

//let newCode = code newCode()

import Foundation

//let d = ["john": 23, "james": 24, "vincent": 34, "louis": 29] let x = d.sorted{ $0.1 < $1.1 }.map{ $0.0 }

// 2) - Criar uma Struct que aceite nome e idade, e printar os valores de saída

struct Pessoa {
    var name: String
    var idade: Int
    
}

print(Pessoa.self)


// 3) - Seguindo o exemplo acima, crie uma stored properties e nela calcule o IMC de uma pessoa. // IMC = peso / (altura x altura)

