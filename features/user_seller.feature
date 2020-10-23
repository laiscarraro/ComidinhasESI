# language: pt

Funcionalidade: Página de vendedor
Como usuário
Quero poder clicar no vendedor do produto
Para que eu possa ver as informações da página do vendedor

Cenário: Voltar para a página de produto
Dado que estou na página do vendedor
Quando clico no botão de voltar
Então o usuário deve ser redirecionado para a página anterior

Cenário: Visualizar produtos do vendedor
Dado que estou na página do vendedor
Quando clico no produto com id "12"
Então o usuário deve ser redirecionado para a página do produto "12"