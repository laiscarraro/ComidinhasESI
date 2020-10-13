#language: pt

Funcionalidade: Barra de navegação
Como usuário logado
Preciso conseguir navegar no site e também visitar meu perfil

Contexto: Logado
Dado que estou cadastrado
E que estou na tela de login
Quando insiro meu nome de usuário 'user'
E insiro minha senha 'senha'
E aperto em login

Cenário: Perfil redireciona para perfil
Dado que estou na página home
Quando clico em perfil na navbar
Então devo ser redirecionado para a página de perfil
