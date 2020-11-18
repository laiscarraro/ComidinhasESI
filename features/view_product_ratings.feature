#language: pt

Funcionalidade: Mostrar Avaliações do Produto
Como usuário
Eu quero ver as avaliações de um produto
Para poder verificar a qualidade da comidinha

Cenário: Ver avaliações do produto
Dado que estou na tela do produto
E há avaliações cadastradas
Quando aperto em 'Avaliações'
Então devo ver as avaliações do produto
E não devo ver as avaliações que não pertencem a ele

Cenário: Não haver avaliações de produto me mostra uma mensagem
Dado que estou na tela do produto
Quando aperto em 'Avaliações'
Então devo ver a mensagem 'Não há avaliações para este produto'