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
 
Cenário: Acessar comidinhas em uma categoria
Dado que estou na página home
Quando aperto em uma categoria
Então deve mostrar apenas comidinhas da categoria selecionada 

Cenário: Explorar produtos
Dado que estou na página home
Quando aperto no icone de explorar
Então deve mostrar comidinhas diferentes

Cenário: Acessar dados do usuário
Dado que estou na página home
Quando aperto no icone de perfil
Então deve mostrar as informações do usuário