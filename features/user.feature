# language: pt

Funcionalidade: Página de usuário
Como usuário
Para que eu possa visualizar meu perfil
Para que eu possa adicionar produtos

Contexto: Logado
Dado que estou cadastrado
E que estou na tela de login
Quando insiro meu nome de usuário 'usuario'
E insiro minha senha 'senha'
E aperto em login

Cenário: Adição de produto 
Dado que estou na página do usuário
Quando clico em adicionar produto
Então o usuário deve ser redirecionado para a página de adicionar produto 

Cenário: Logout
Dado que estou na página do usuário
Quando clico sair
Então o usuário deve ser redirecionado para a página de login



