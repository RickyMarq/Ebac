import UIKit

print("-- Exerc 1 --")

class Empregado {
    var nome: String
    var sobreNome: String
    
    var nomeCompleto: String {
        return "\(nome) \(sobreNome)"
    }
    
    init(nome: String, sobreNome: String) {
        self.nome = nome
        self.sobreNome = sobreNome
    }
}

var Empregado01 = Empregado(nome: "Henrique", sobreNome: "Marques")

var Empregado02 = Empregado01

Empregado01.sobreNome = "Ferreira"

print("-- Exerc 2 --")

print(Empregado01.nomeCompleto)
print(Empregado02.nomeCompleto)

// Mesmo trocando o valor do Empregado01 a variável Empregado02 também é modificada pois trocamos a refência da classe.

// O mesmo não acontece com structs

struct Rg {
    var idade: Int
    var sexo: String
    
    var RG: String {
        return "\(idade) \(sexo)"
    }
}

var Henrique = Rg(idade: 19, sexo: "Masculino")

var CloneDoHenrique = Henrique

Henrique.idade = 20

print("O Henrique tem \(Henrique.idade) anos")
print("O Clone do Henrique tem \(CloneDoHenrique.idade) anos")

// Como vimos structs passam tipo valor do objeto
