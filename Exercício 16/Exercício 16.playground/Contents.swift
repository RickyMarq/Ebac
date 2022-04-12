import UIKit

// 1) - Qual é a diferença entre tarefas assíncronas e síncronas?

/*

 Assíncronas: Completa uma tarefa em segundo plano e notifica quando termina.
  
 Duas tarefas não se conhecem e não são dependentes, as tarefas não ocorrem de forma hieráquica ou sequêncial.
 
 Síncronas: Fila de tarefas que esperam a anterior ser concluída para começar uma nova tarefa, alocando apenas uma thread para completar as tarefas.

*/


// 2) - Qual é a diferença entre uma fila(queue)concorrente e serial?

/*
 
 Serial: Executam uma tarefa na ordem que elas foram adicionadas na fila, uma por vez.

 Concorrente: Executam múltiplas tarefas ao mesmo tempo, todas as tarefas adicionadas na fila irão rodar paralelamente enquanto houver threads disponíveis.
 
 */


// 3) - Ache algumas APIs públicas na internet


/*
 
 API que te dá um conselho :)
 
 Conselhos: https://api.adviceslip.com/advice
 
 API que é praticamente um compêndio sobre gatos
 
 Gatos: https://api.thecatapi.com/v1/images/search
 
 API que lista dados sobre Pokémons em todos os jogos da franquia
 
 Pokémon: https://pokeapi.co/api/v2/pokemon/ditto
 */
