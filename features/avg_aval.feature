#language: pt

Funcionalidade: Média das avaliações do vendedor
Como usuário
Quero poder ver a média de corações das avaliações do vendedor
Para que eu possa saber se ele é um bom vendedor segundo seu público

Cenário: Vendedor com avaliações
Dado que estou na página do vendedor
E o vendedor possui produtos cadastrados
E pelo menos um produto possui pelo menos uma avaliação
Então devo ver a média de todas as avaliações

Cenário: Vendedor sem avaliações
Dado que estou na página do vendedor
E o vendedor possui produtos cadastrados
E todos os produtos não possuem avaliações
Então devo ver um traço no campo da média de avaliações

Cenário: Vendedor sem produtos
Dado que estou na página do vendedor
E o vendedor não possui produtos cadastrados
Então devo ver um traço no campo da média de avaliações