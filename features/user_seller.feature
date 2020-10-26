# language: pt

Funcionalidade: Página de vendedor
Como usuário
Quero poder clicar no vendedor do produto
Para que eu possa ver as informações da página do vendedor

Contexto: Existe um usuário cadastrado
Dado que estou na paǵina de cadastro de usuário
Quando clico em fazer upload de um avatar
Quando preencho o campo "email" com "maria@usp.br"
Quando preencho o campo "username" com "Maria"
Quando preencho o campo "password" com "senha123"
Quando preencho o campo "password_confirmation" com "senha123"
E clico em termos
E clico em criar
Então o usuario deve ter sido salvo no banco de dados 

Cenário: Voltar para a página de produto
Dado que estou na página do vendedor
Quando clico em voltar
Então o usuário deve ser redirecionado para a página anterior

Cenário: Visualizar produtos do vendedor
Dado que estou na página do vendedor
E o vendedor possui produtos cadastrados
Então o usuário deve ver os produtos do vendedor