# language: pt

Funcionalidade: Página de usuário
Como usuário
Para que eu possa visualizar meu perfil
Para que eu possa visualizar meus produtos
Para que eu possa adicionar produtos

Cenário: Adição de produto 
Dado que estou na página do usuário
Quando clico em adicionar produto
Então o usuário deve ser redirecionado para a página de adicionar produto 

Cenário: Visualizar meus produtos
Dado que estou na página do usuário
Quando clico em produto
Então o usuario deve ser redirecionado para a página do produto

Cenário: Logout
Dado que estou na página do usuário
Quando clico sair
Então o usuário deve ser redirecionado para a página de login



