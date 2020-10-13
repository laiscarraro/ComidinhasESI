#language: pt

Funcionalidade: Barra de navegação
Como usuário
Preciso conseguir navegar no site

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
