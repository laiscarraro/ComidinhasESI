#language: pt

Funcionalidade: Adicionar Produto

Cenário: Adição de produto com sucesso
Dado que estou na página de adição de produto
Quando preencho o campo "Nome do Produto" com "Cone"
Quando preencho o campo "Preço" com "6.00"
Quando preencho o campo "Descrição" com "Melhor que o cone do Wilson"
Quando seleciono a categoria "Doce"
Quando clico em fazer upload de uma foto
E clico em adicionar
Então o produto deve ter sido salvo no banco de dados

Cenário: Adição de produto com erro - Sem nome do produto
Dado que estou na página de adição de produto
E deixo o campo "Nome do Produto" vazio
Quando preencho o campo "Preço" com "6.00"
Quando preencho o campo "Descrição" com "Melhor que o cone do Wilson"
Quando seleciono a categoria "Doce"
Quando clico em fazer upload de uma foto
E clico em adicionar
Então deverei ver a mensagem de erro "É obrigatório informar o nome do produto"

Cenário: Adição de produto com erro - Sem o preço
Dado que estou na página de adição de produto
Quando preencho o campo "Nome do Produto" com "Cone"
E deixo o campo "Preço" vazio
Quando preencho o campo "Descrição" com "Melhor que o cone do Wilson"
Quando seleciono a categoria "Doce"
Quando clico em fazer upload de uma foto
E clico em adicionar
Então deverei ver a mensagem de erro "É obrigatório informar o preço do produto"

Cenário: Adição de produto com sucesso - Sem descrição
Dado que estou na página de adição de produto
Quando preencho o campo "Nome do Produto" com "Cone"
Quando preencho o campo "Preço" com "6.00"
E deixo o campo "Descrição" vazio
Quando seleciono a categoria "Doce"
Quando clico em fazer upload de uma foto
E clico em adicionar
Então o produto deve ter sido salvo no banco de dados

Cenário: Adição de produto com sucesso - Sem foto
Dado que estou na página de adição de produto
Quando preencho o campo "Nome do Produto" com "Cone"
Quando preencho o campo "Preço" com "6.00"
E deixo o campo "Descrição" vazio
Quando seleciono a categoria "Doce"
E clico em adicionar
Então deverei ver a mensagem de erro "É obrigatório adicionar uma foto do produto"

Cenário: Adição de produto com erro - Preço com mais de duas casas decimais
Dado que estou na página de adição de produto
Quando preencho o campo "Nome do Produto" com "Cone"
Quando preencho o campo "Preço" com "6.052"
Quando preencho o campo "Descrição" com "Melhor que o cone do Wilson"
Quando seleciono a categoria "Doce"
Quando clico em fazer upload de uma foto
E clico em adicionar
Então deverei ver a mensagem de erro "O formato de preço é inválido"

Cenário: Adição de produto com erro - Preço com mais de duas casas decimais
Dado que estou na página de adição de produto
Quando preencho o campo "Nome do Produto" com "Cone"
Quando preencho o campo "Preço" com "0.10"
Quando preencho o campo "Descrição" com "Melhor que o cone do Wilson"
Quando seleciono a categoria "Doce"
Quando clico em fazer upload de uma foto
E clico em adicionar
Então deverei ver a mensagem de erro "O preço precisa ser um número entre R$ 0,50 e R$ 10.000"

Cenário: Adição de produto com erro - Preço com 1 casa decimal
Dado que estou na página de adição de produto
Quando preencho o campo "Nome do Produto" com "Cone"
Quando preencho o campo "Preço" com "6.0"
Quando preencho o campo "Descrição" com "Melhor que o cone do Wilson"
Quando seleciono a categoria "Doce"
Quando clico em fazer upload de uma foto
E clico em adicionar
Então o produto deve ter sido salvo no banco de dados
