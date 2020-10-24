Dado('que estou na página do produto que adicionei') do
  visit "product/0"
end

Dado('que o produto pertence a mim') do
  expect(page).to have_content('user')
end

