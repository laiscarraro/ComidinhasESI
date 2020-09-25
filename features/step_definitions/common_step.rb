Então('deverei ver a mensagem de erro {string}') do |string|
    expect(page).to have_content(string)
  end

Quando('deixo o campo {string} vazio') do |string|
    fill_in string, :with => ""
end

Quando('preencho o campo {string} com {string}') do |string, string2|
    fill_in string, :with => string2  
end

