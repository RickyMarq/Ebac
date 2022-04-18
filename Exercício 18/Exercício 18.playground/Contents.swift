import UIKit


// Exercício Módulo-18

// 1. O que são Generics e quais problemas eles resolvem?

/* Função do Swift que permite criar funções e tipos que não estão vinculados a nenhum tipo específico, além de poderem ser reutilizados.

 Uma Array é um generic, pois aloca vários dados independente de seu tipo, seja Int ou uma Double.

 O problema que o generics resolve e a duplicação de código, como ele não tem nenhuma tipagem específica.
 
 */

//2. Dê um exemplo de uso de generics.

// Se o generics não existisse, teriamos que criar 2x funções para lidar com dados que são diferentes

func PrintArrays<T>(array:[T]) {
    for item in array {
        print(item, terminator: " . ")
    }
}

PrintArrays(array: ["Henrique"])
PrintArrays(array: [19])

// A função PrintArrays() aceita Ints e Strings.


// 3. Quais os cuidados que se deve tomar, ao usar políticas para caches?

/* Observando e tendo conhecimento de cada implementação da política de cache do app, sabendo o que cada propriedade faz ou não faz.
 

 1 - UseProtocolCachePolicy: Propriedade padrão, o protocolo irá ditar a melhor política de cache será usada, caso não existindo um cache o mesmo irá buscar na URL

 
 2 - RealoadIgnoringCacheData: Essa propriedade vai ignorar o cache local e recuperar os dados da fonte novamente na origem.
 
 
 3 - ReturnCacheDataElseLoad: Ele vai usar o cache local se ele existir, caso não o mesmo irá recuperar os dados da fonte.
 
   Entretanto essa é um propriedade perigosa porque ele usa os dados de cache independente da idade ou expiração, logicamente se não houver a limpeza de cache com o removeallCachedResponses.
 
 
 4 - ReturnCacheDataDontLoad: Esse vai retornar uma cópia local de dados, caso existir, mas caso não exista ele vai retornar um nil ou uma "falha".
 
 */


// 4. Dê um exemplo de uso de Closure com escaping e sem escaping, observando o uso do weak self.


print("--- Sem Escaping ---")

// Sem Escaping - Quando passamos uma closure como argumento de uma função, a closure é executada no corpo da função e após isso a closure sai do escopo do projeto e não ocupa mais nenhum lugar na memória.


func SemEscaping(sem Noescaping: () -> Void) {
    Noescaping()
}

// O Parâmetro "escaping" não possui escaping realmente, portanto só será executada no corpo da função.

print("--- Com Escaping ---")


/* Com Escaping - Closure que também é passada como argumento de uma função mas é preservada para ser usada novamente, alocando espaço na memória.

   Ter uma closure com escaping também significa que a mesma pode ser chamada fora do escopo.
 
   Usamos esse tipo de closure quando precisamos que algo dure mais tempo do que apenas uma closure normal, esse tipo de funcionalidade é normalmente usada com Networking dentro de um app.
 
*/

func ComEscaping(com Escaping: @escaping () -> Void) {
    DispatchQueue.main.async {
        Escaping()
    }
}
