#language: pt

Funcionalidade: Média das avaliações do vendedor
Como usuário
Quero poder ver a média de corações das avaliações do vendedor
Para que eu possa saber se ele é um bom vendedor segundo seu público

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

Cenário: Vendedor com avaliações
Dado que estou na página do vendedor
E o vendedor possui produtos cadastrados
Quando pelo menos um produto possui pelo menos uma avaliação
Então devo ver a média de todas as avaliações

Cenário: Vendedor sem avaliações
Dado que estou na página do vendedor
E o vendedor possui produtos cadastrados
Quando todos os produtos não possuem avaliações
Então devo ver "-" no campo da média de avaliações

Cenário: Vendedor sem produtos
Dado que estou na página do vendedor
E o vendedor não possui produtos cadastrados
Então devo ver "-" no campo da média de avaliações