# language: pt

Funcionalidade: Visualizar métodos de pagamento de vendedor
Como usuário
Quero poder visualizar os meus métodos de pagamento e dos outros vendedor
Para que eu e outros possam saber como posso pagar pelos produtos

Cenário: Ver métodos de pagamento de outro vendedor
Dado que estou na página de um vendedor
E que ele aceita o método de pagamento VR e cartão
Então devo ver o método "Cartão" na página
E devo ver o método "VR" na página

Cenário: Ver meus próprios métodos de pagamento
Dado que estou cadastrado
E que estou na tela de login
Quando insiro meu nome de usuário 'user'
E insiro minha senha 'senha'
E aperto em login
Dado que estou na página de usuário
E aceito os métodos de pagamento VR e Cartão
Então devo ver o método "Cartão" na página
E devo ver o método "VR" na página
 