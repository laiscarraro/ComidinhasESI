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
E não devo ver comidinhas que contenham o nome "Lanches Naturais" ou "Cereais"

Cenário: Não encontrou a comidinha
Dado que estou na página home
Quando pesquiso uma comidinha que não existe
Então devo ver uma mensagem de "sem resultados"

Cenário: Ver todas as categorias
Dado que estou na página home
Então devo ver todas as categorias cadastradas

Cenário: Acessar comidinhas em uma categoria
Dado que estou na página home
Quando aperto a categoria "Massa"
Então deve mostrar apenas comidinhas da categoria como "Pizza" e não "Cones do Wilson", "Lanches Naturais" ou "Cereais"