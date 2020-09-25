# language: pt

Funcionalidade: Cadastrar usuário
Como usuário 
Para que eu possa vender produtos
Para que eu possa ver quem estar na EACH
Para que eu possa ver a avaliação dos produtos 
Para que eu possa avaliar produtos

Cenário: Cadastro de usuário com sucesso
Dado que estou na paǵina de cadastro de usuário
Quando preencho o campo "email" com "maria@usp.br"
Quando preencho o campo "username" com "Maria"
Quando preencho o campo "password" com "senha123"
Quando preencho o campo "password_confirmation" com "senha123"
E clico em termos
E clico em criar
Então o usuario deve ter sido salvo no banco de dados 
E ser redirecionado para a home

Cenário: Cadastro de usuário com erro - sem email
Dado que estou na página de cadastro de usuário
Quando deixo o campo "email" vazio
E clico em criar
Então deverei ver a mensagem de erro "É obrigatório informar o email"

Cenário: Cadastro de usuário com erro - email invalido
Dado que estou na página de cadastro de usuário
Quando preencho o campo "email" com "banana"
E clico em criar
Então deverei ver a mensagem de erro "O email informado é inválido"

Cenário: Cadastro de usuário com erro - sem username
Dado que estou na página de cadastro de usuário
Quando deixo o campo "username" vazio
E clico em criar
Então deverei ver a mensagem de erro "É obrigatório informar o username"

Cenário: Cadastro de usuário com erro - sem senha
Dado que estou na página de cadastro de usuário
Quando deixo o campo "password" vazio
E clico em criar
Então deverei ver a mensagem de erro "É obrigatório informar a senha"

Cenário: Cadastro de usuário com erro - senha não corresponde
Dado que estou na página de cadastro de usuário
Quando preencho o campo "password" com "senha123"
E preencho o campo "password_confirmation" com "senha1234"
E clico em criar
Então deverei ver a mensagem de erro "Senha não corresponde"

