Dado("que esteja na tela de Login") do
  @home_page.go
  @home_page.login_click
end

Quando('eu faço o login com {string} e {string}') do |email, senha|
  @login_page.login_with(email, senha)
end

Então("vejo {string} no menu logado") do |loged_user|
  expect(@login_page.loged_user).to eq loged_user
end

Então("devo ver a mensagem de alerta {string}") do |expect_alert|
  expect(@login_page.alert).to have_content expect_alert
end
