# language: pt

Funcionalidade: Editar Produto
Como vendedor
Eu quero poder mudar as informações dos meus produtos
Para poder manter os outros usuários atualizados

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


Cenário: Mudar nome do produto existente
Dado que estou na página de edição de produto
Então devo ver as informações do produto na tela
Quando preencho o campo "Nome do Produto" com "Casca de Sorvete"
E clico em salvar
Então o produto deve ter sido modificado no banco de dados

Cenário: Mudar imagem do produto existente
Dado que estou na página de edição de produto
Então devo ver as informações do produto na tela
Quando clico em fazer upload de uma foto diferente
E clico em salvar
Então o produto deve ter tido a imagem mudada no banco de dados