Quando('clico em home na navbar') do
  click_on 'home'
end

Quando('clico em perfil na navbar') do
  click_on 'perfil'
end

Então('devo ter sido redirecionado para a página de login') do
  expect(page).to have_current_path(user_path)
end

Então('devo ser redirecionado para a página de perfil') do
  expect(page).to have_current_path(user_index_path)
end

Dado('que estou na página de login') do
  visit login_index_path
end

Dado('que estou na página de perfil') do
  visit user_path
end