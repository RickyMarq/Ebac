import UIKit

var greeting = "Hello, playground"

print("Exerc 1")
// 1) Se a seguinte declaração fosse chamada, qual seria o resultado?
var state = true

if state == true {
    print("Allow access")
} else {
    print("Deny access")
}

print("O resultado seria allow acess")

print("Exerc 2")
// 2) Crie uma loop e use de condições para saber se o numero é par ou ímpar, dado a essa varialvel:
var arrayNumber = [1,2,3,4,5,6,7,8,9,10]
 
for i in arrayNumber {
    if(i % 2 == 0) {
        print("\(i) é par")
    } else {
        print("\(i) é ímpar")
    }
}
// 3) Tente fazer o mesmo exercicio 2, porém com while


print("Exerc 3")

var count = 0
while count < arrayNumber.count  {
    let number = arrayNumber[count]
    let lógica = number%2
    
    if lógica == 0 {
        print("\(number.description) é par")
    } else {
        print("\(number.description) é Ímpar")
    }
    
    count += 1
}
