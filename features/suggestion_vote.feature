#language: pt

Funcionalidade: Votar em uma Sugestão
Como usuário
Eu quero votar em sugestões
Para que eu impulsione ela e mostre que concordo com ela

Contexto: Estou logado e adicionei uma sugestão
Dado que estou cadastrado
E que estou na tela de login
Quando insiro meu nome de usuário 'user'
E insiro minha senha 'senha'
E aperto em login
Dado que estou na tela de explorar
Quando preencho o campo "suggestion" com "Brigadeiro"
E clico em sugerir
Então a sugestão deve ter sido armazenada no banco de dados
E devo ver a sugestão na tela

Cenário: Votem em uma sugestão com sucesso
Dado que estou na tela de explorar
Quando voto na sugestão "Brigadeiro"
Então deverei ver que a contagem mudou para "1"
