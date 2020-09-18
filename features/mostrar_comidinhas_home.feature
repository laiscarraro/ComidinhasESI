#language: pt

Funcionalidade: Mostrar as comidinhas na home
Como usuário
Para que eu possa comprar comidinhas de vendedores
Eu preciso vê-las na home

Cenário: Mostrar todas as comidinhas
Dado que estou na página home
Então deve aparecer para mim todas as comidinhas

Cenário: Mostrar comidinhas que eu pesquisei
Dado que estou na página home
Quando eu preencho o campo "search" com "cone"
E aperto "pesquisar"
Então devo ver comidinhas que contenham esse nome