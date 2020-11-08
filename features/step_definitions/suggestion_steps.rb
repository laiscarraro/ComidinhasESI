Dado('que estou na tela de explorar') do
  visit suggestions_path
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
