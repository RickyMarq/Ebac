import UIKit

print("-- Exercício 1 --")
print("- Diferenças Entre Structs e Classes -")


print("1 - Classes são tipo Refências e Structs são tipos de valores")

/* Ok, mas o que são tipos refência e tipo de valores ?
 
 Tudo é sobre copiar tanto Structs and Classes.
 
 Quando você copia uma Struct você acaba com duas cópias diferentes.
 
 No outro lado quando você copia uma Class acabamos com duas refêrencias de um dado só.
 
 */

// Primeiro com o tipo valor...

struct Pessoa {
    var nome: String
    var idade: Int
}

var Henrique = Pessoa(nome: "Henrique", idade: 19)
var AlterEgoHenrique = Henrique

AlterEgoHenrique.idade = 36

print(Henrique.idade)
print(AlterEgoHenrique.idade)

// Nesse exemplo com Structs temos duas instâncias diferentes, o Henrique tem 19 anos, mas o Alterego dele tem 36

// Agora com o tipo Refência

class Pessoa01 {
    var nome: String
    var idade: Int
    
    init(nome: String, idade: Int) {
        self.nome = nome
        self.idade = idade
    }
}

var Amanda = Pessoa01(nome: "Amanda", idade: 14)
var AlterEgoAmanda = Amanda

AlterEgoAmanda.idade = 26

print(Amanda.idade)
print(AlterEgoAmanda.idade)

// Como visto, quando mudamos o valor de AlterEgo ele também altera o outro.

print("2 - Classes não vem com um inicializador, diferente das Structs")

class vídeogame {
    var nome: String
    var anoDeLançamento: Int
    
    init(nome: String, anoDeLançamento: Int) {
        self.nome = nome
        self.anoDeLançamento = anoDeLançamento
    }
}

let Switch = vídeogame(nome: "Nintendo Switch", anoDeLançamento: 2017)

// Agora com Structs...

struct VídeogamePortátil {
    var nome: String
    var ano: Int
}

// Structs não precisam de inicializadores, pois já possuem por padrão.

let PSP = VídeogamePortátil(nome: "PlayStationPortable", ano: 2004)


print("3 - Classes tem o método -deinit-, structs não.")

// O método deinit é uma parte do código que roda após quando uma parte de uma classe é destruída.

class FaculdadeANoite {
    var nome = "Henrique"
    
    init() {
        print("\(nome) foi a faculdade")
    }
    
    deinit {
        print("\(nome) cansou de assitir a aula e foi para a casa dormir")
        }
    
    func AulasDeSexta() {
        print("A aula é tediosa")
    
    }
}

for _ in 1..<2 {
    let Faculdade = FaculdadeANoite()
    Faculdade.AulasDeSexta()

}


print("-- Exercício 2 --")
print("- Relação entre Classe e Objeto -")

// Objetos são coleções de dados, sejam variáveis ou métodos dentro de uma classe.

// Classes são "plantas" de objetos
 
class Banda {
    var nome: String
    var ano: Int
    
    init(nome: String, ano: Int) {
        self.nome = nome
        self.ano = ano
    }
}

// Classe é a banda.

let aha = Banda(nome: "A-ha", ano: 1985)

// "aha" é um objeto da classe "banda".

print("-- Exercício 3 --")
print("- Qual a diferença entre Classe e Objeto -")

// Classes é um grupo de objetos similares, como "Carros".

// Objeto é a entidadade física, ou seja o nome do carro.

class Carro {
    var nome: String
    var marca: String
    var ano: Int
    
    init(nome:String, marca: String, ano: Int) {
        self.nome = nome
        self.marca = marca
        self.ano = ano
    }
}

let Clio = Carro(nome: "Clio", marca: "Renault", ano: 2006)

