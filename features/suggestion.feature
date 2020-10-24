#language: pt

Funcionalidade: Sugestão
Como usuário
Eu quero colocar que comidinha eu sinto falta
Para que seja possível alguém começar a vender essa comidinha

Cenário: Adicionar Sugestão com sucesso
Dado que estou na tela de explorar
Quando preencho o campo "suggestion" com "Brigadeiro"
E clico em sugerir
Então a sugestão deve ter sido armazenada no banco de dados
E devo ver a sugestão na tela

Cenário: Adicionar Sugestão com erro - Sem nome
Dado que estou na tela de explorar
Quando deixo o campo "suggestion" vazio
E clico em sugerir
Então deverei ver a mensagem de erro "Sugestão está vazia"

# TODO
# Cenário: Votar em Sugestão com sucesso
# Dado que estou na tela de explorar
# Quando clico em gostei do produto "Brigadeiro"
# Então os votos de brigadeiro devem ter sido aumentados no banco de dados
# E devo ver o número aumentado na tela