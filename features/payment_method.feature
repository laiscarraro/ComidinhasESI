# language: pt

Funcionalidade: Métodos de pagamento
Como vendedor
Quero poder adicionar os métodos de pagamento que eu aceito
Para que os usuários possam ver os métodos de pagamento para os meus produtos 

Contexto: Logado
Dado que estou cadastrado
E que estou na tela de login
Quando insiro meu nome de usuário 'user'
E insiro minha senha 'senha'
E aperto em login

Cenário: Adicionar métodos de pagamento
Dado que estou na página de usuário
Quando clico em adicionar métodos de pagamento
E clico nos métodos que eu aceito
Então eles devem aparecer na minha página de vendedor 
