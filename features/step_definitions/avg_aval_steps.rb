Quando('pelo menos um produto possui pelo menos uma avaliação') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
Então('devo ver a média de todas as avaliações') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
Quando('todos os produtos não possuem avaliações') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
Então('devo ver um traço no campo da média de avaliações') do
    pending #expect(page).to have_content("-")
end
  
Dado('o vendedor não possui produtos cadastrados') do
    expect(@products).to eq(nil)
end