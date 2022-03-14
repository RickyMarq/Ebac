import UIKit

// 1) - Seguindo este array abaixo, qual valor é o outuput dessa função?

var frutas = ["Maçã", "Banana", "Melão", "Pêra"]

var comida = frutas[3]

/* O valor de Output é: Pêra

Apesar estar na quarta posição na array devemos lembrar que arrays começam a contar do 0

 Então o correto é:

    0 - Maça // 1 - Banana // 2 - Melão // 3 - Pêra

 */

// 2) - Seguindo o mesmo exercício acima, agora inclua a fruta Pera, troque de posição Banana e Melão. // No final conte quantas frutas tem no novo Array.

frutas.insert("Pera", at: 4)

frutas.swapAt(1, 2)

print("A array frutas contém \(frutas.count) valores")

// 3) - Pensando nesse codigo abaixo, qual é o tipo de x ? E qual é o seu valor?

let d = ["john": 23, "james": 24, "vincent": 34, "louis": 29]

let x = d.sorted{ $0.1 < $1.1 }.map{ $0.0 }

/* x é do tipo Array de Strings

 O Dicionário foi transformado em uma Array utilizando o MAP, pegando apenas a chave, assim formando uma Array

 */
