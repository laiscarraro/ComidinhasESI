#language: pt

Funcionalidade: Produtos pertencem a vendedores
Como usuário
Para que eu tenha visibilidade
Eu preciso poder adicionar e gerenciar meus produtos

Contexto: Logado e com Produto Cadastrado
Dado que estou cadastrado
E que estou na tela de login
Quando insiro meu nome de usuário 'user'
E insiro minha senha 'senha'
E aperto em login
Dado que estou na página de adição de produto
Quando preencho o campo "Nome do Produto" com "Cone"
Quando preencho o campo "Preço" com "6.00"
Quando preencho o campo "Descrição" com "Melhor que o cone do Wilson"
Quando seleciono a categoria "Doce"
Quando clico em fazer upload de uma foto
E clico em adicionar
Então o produto deve ter sido salvo no banco de dados

Cenário: Ver Opções do Vendedor
Dado que estou na página do produto que adicionei
E que o produto pertence a mim
Então devo ver a seção "Opções do Vendedor"

Cenário: Remover produto
Dado que estou na página do produto que adicionei
E que o produto pertence a mim
Quando clico em "REMOVER"
Então devo ser redirecionado para a página de perfil
