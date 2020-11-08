#language: pt

Funcionalidade: Avaliação de Produtos
Como usuário
Eu quero avaliar os produtos
Para poder classificar os produtos por ordem de qualidade

Cenário: Ser redirecionado para para página de login quando não estou logado
Dado que estou na tela do produto
Quando aperto em 'Avaliar'
Então devo ser redirecionado para página de login

Cenário: Fazer uma avaliação para o produto
Dado que estou na tela do produto
E logado no sistema
Quando aperto em 'Avaliar'
E faço uma avaliação com comentário "Muito Bom!"
Então devo ser redirecionado para a página de produto

Cenário: Fazer uma avaliação sem comentário gera uma mensagem de erro
Dado que estou na tela do produto
E logado no sistema
Quando aperto em 'Avaliar'
Quando faço uma avaliação sem escrever um comentário
Então devo ver uma mensagem de erro "1 erro na sua avaliação:\nA avaliação precisa ter um comentário!"

Cenário: Não fazer uma avaliação e escrever comentário gera mensagem de erro
Dado que estou na tela do produto
E logado no sistema
Quando aperto em 'Avaliar'
Quando não faço uma avaliação e escrevo um comentário "Bom!"
Então devo ver uma mensagem de erro "2 erros na sua avaliação:\nÉ obrigatório dar uma nota para a avaliação!\nA avaliação precisa ser um número inteiro entre 1 e 5!"

Cenário: Não fazer uma avaliação nem escrever um comentário gera mensagem de erro
Dado que estou na tela do produto
E logado no sistema
Quando aperto em 'Avaliar'
Quando não faço uma avaliação nem escrevo um comentário
Então devo ver uma mensagem de erro "3 erros na sua avaliação:\nÉ obrigatório dar uma nota para a avaliação!\nA avaliação precisa ser um número inteiro entre 1 e 5!\nA avaliação precisa ter um comentário!"