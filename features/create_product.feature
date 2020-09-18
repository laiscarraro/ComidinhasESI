#Language pt

Funcionalidade: Adicionar Produto

Cenário: Adição de produto com sucesso
Dado que estou na página de adição de produto
Quando preencho o campo "Nome do Produto" com "Cone"
Quando preencho o campo "Preço" com "6.00"
Quando preencho o campo "Descrição" com "Melhor que o cone do Wilson"
E clico em adicionar
Então ele deve ter sido salvo no banco de dados
E deverei ver o produto na página principal

Cenário: Adição de produto com erro - Sem nome do produto
Dado que estou na página de adição de produto
Quando preencho o campo "Preço" com "6.00"
E deixo o campo "Nome do Produto" vazio
E clico em adicionar
Então deverei ver a mensagem de erro "É obrigatório informar o nome do produto"

Cenário: Adição de produto com erro - Sem o preço
Dado que estou na página de adição de produto
Quando preencho o campo "Nome do Produto" com "Cone"
E deixo o campo "Preço" vazio
E clico em adicionar
Então deverei ver a mensagem de erro "É obrigatório informar o preço do produto"

Cenário: Adição de produto com sucesso - Sem descrição
Dado que estou na página de adição de produto
Quando preencho o campo "Nome do Produto" com "Cone"
Quando preencho o campo "Preço" com "6.00"
E clico em adicionar
Então ele deve ter sido salvo no banco de dados
E deverei ver o produto na página principal

Cenário: Adição de produto com erro - Preço com mais de duas casas decimais
Dado que estou na página de adição de produto
Quando preencho o campo "Nome do Produto" com "Cone"
Quando preencho o campo "Preço" com "6.000"
E clico em adicionar
Então deverei ver a mensagem de erro "O preço do produto está errado"

Cenário: Adição de produto com erro - Preço com 1 casa decimal
Dado que estou na página de adição de produto
Quando preencho o campo "Nome do Produto" com "Cone"
Quando preencho o campo "Preço" com "6.0"
E clico em adicionar
Então ele deve ter sido salvo no banco de dados
E deverei ver o produto na página principal
