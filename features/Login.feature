#language: pt

Funcionalidade: Login
Como vendedor
Eu quero fazer login
Para que meus produtos sejam associados a mim

Cenário: Login autenticado
Dado que estou na tela de login
Quando insiro meu nome de usuário 'usuario'
E insiro minha senha 'senha'
E aperto em login
Então devo estar logado no sistema

Cenário: Usuário inexistente
Dado que estou na tela de login
Quando eu aperto a barra de usuário
E insiro um usuário errado 'inexistente'
Então devo ver uma mensagem de erro de usuário

Cenário: Senha incorreta
Dado que estou na tela de login
Quando eu aperto a barra de usuário
E insiro meu nome de usuário correto 'usuario'
E aperto a barra de senha
E insiro a senha incorretamente 'errado'
E aperto em login
Então devo ver uma mensagem de erro de senha