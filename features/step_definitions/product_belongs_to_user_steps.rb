Dado('que estou na página do produto que adicionei') do
  visit "/product/1"
end

E('que o produto pertence a mim') do
  expect(page).to have_content('user')
end

Então('devo ver a seção {string}') do |string|
  expect(page).to have_content(string)
end

