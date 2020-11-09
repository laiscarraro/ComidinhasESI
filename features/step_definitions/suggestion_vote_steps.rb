Quando('voto na sugestão {string}') do |string|
  find('div.suggestion-card span', text: "#{string}", match: :first)
  first('a').click
end

Então('deverei ver que a contagem mudou para {string}') do |string|
  expect(page).to have_content(string)
end
