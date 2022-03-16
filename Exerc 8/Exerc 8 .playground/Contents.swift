import Foundation

//// 1) - Qual o  tipo de x, e o que será printado referente ao valor x?

var language = "Objc"

let code = { [language] in
    print(language)
}

language = "Swift"
let newCode = code

let d = ["john": 23, "james": 24, "vicent": 34, "louis": 29]
let x = d.sorted { $0.1 < $1.1 }.map{ $0.0 }
print(x)

// X é uma Array de Strings ordenadas do menor até o maior número de caracteres.

// D é um dicionário que guarda chaves e valores, X herda apenas as chaves além de ter sido transformado em uma Array com o MAP

// 2) - Criar uma Struct que aceite nome e idade, e printar os valores de saída

struct Pessoa {
    var nome: String
    var idade: Int
    
    var Dados: String {
        return "Olá \(nome) de \(idade) anos"
    }
}

var henrique = Pessoa(nome: "Henrique", idade: 19)
print(henrique.Dados)


// 3) - Seguindo o exemplo acima, crie uma stored properties e nela calcule o IMC de uma pessoa. // IMC = peso / (altura x altura)

struct IMC {
    var peso: Double
    var altura: Double
    
    var imc: Double {
         return peso / (altura * altura)
    }
}


var calcular = IMC(peso: 64, altura: 1.75)
print("Seu IMC é \(calcular.imc)")
