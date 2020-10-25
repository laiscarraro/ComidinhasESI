Dado('que estou na tela de explorar') do
  visit 'suggestions' 
end

Quando('clico em sugerir') do 
   click_on 'add_suggestion'
end

Então('a sugestão deve ter sido armazenada no banco de dados') do
  suggestion = Suggestion.order("id").last
  expect(suggestion.name).to eq("Brigadeiro")
end

Então('devo ver a sugestão na tela') do
  expect(page).to have_content("Brigadeiro")  
end

Quando('clico em gostei do produto {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions  
end

Então('os votos de brigadeiro devem ter sido aumentados no banco de dados') do 
  pending # Write code here that turns the phrase above into concrete actions  
end

Então('devo ver o número aumentado na tela') do
  pending # Write code here that turns the phrase above into concrete actions  
end