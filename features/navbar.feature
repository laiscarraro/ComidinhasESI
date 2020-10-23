#language: pt

Funcionalidade: Barra de navegação
Como usuário
Preciso conseguir navegar no site

Cenário: Ir para home
Dado que estou na página de login
Quando clico em home na navbar
Então devo ser redirecionado para a página de home

Cenário: Perfil redireciona para login
Dado que estou na página home
Quando clico em perfil na navbar
Então devo ter sido redirecionado para a página de login
