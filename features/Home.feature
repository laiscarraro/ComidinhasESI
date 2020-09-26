#language: pt

Funcionalidade: Home
Como usuário
Para que eu possa comprar comidinhas de vendedores
Eu preciso vê-las na home

Cenário: Mostrar todas as comidinhas
Dado que estou na página home
Então deve aparecer para mim todas as comidinhas

Cenário: Mostrar comidinhas que eu pesquisei
Dado que estou na página home
Quando eu preencho o campo "prodname" com "Con"
E aperto em pesquisar
Então devo ver comidinhas que contenham esse nome como "Cones do Wilson"
 
Cenário: Acessar comidinhas em uma categoria
Dado que estou na página home
Quando aperto em uma categoria
Então deve mostrar apenas comidinhas da categoria selecionada 

Cenário: Explorar produtos
Dado que estou na página home
Quando aperto no icone de explorar
Então vou para a página explorar

Cenário: Acessar dados do usuário
Dado que estou na página home
Quando aperto no icone de perfil
Então deve mostrar as informações do usuário

Cenário: Sem internet
Dado que estou na página home
Quando estou sem internet
Então deve mostrar mensagem "Conecte-se a internet para ultilizar o comidinhas"

Cenário: Não encontrou a comidinha
Dado que estou na página home
Quando pesquiso uma comidinha que não existe
Então devo ver uma mensagem de "sem resultados"

Cenário: Acessar comidinhas
Dado que estou na página home
Quando escolho uma comidinha
Então vou para a página dessa comidinha