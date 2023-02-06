
Dado('que acessou o site NOS') do
  login.load
  login.aceitar_todos_cookies
end

Quando('preencho o numero do telemovel') do
  login.preencher_username("912308037")
  login.clicar_entrar
end

Entao('será realizado o login no site da NOS') do
  expect(login.validar_usuario).to eql "Isabela Ziviani Romanini"
end

Quando('preencho o e-mail') do
  login.preencher_username("bella_zr@hotmail.com")
  login.clicar_entrar
end

Quando('preencho o e-mail inexistente') do
  login.preencher_username("teste@teste.com")
  login.clicar_entrar 
end

Entao('será apresentado mensagem de erro {string}') do |mensagem_erro|
  expect(login.validacao_mensagem_erro).to eql mensagem_erro
end

Quando('preencho o campo Senha') do
  login.preencher_password("Teste@412861")
  login.clicar_entrar
end

Quando('preencho o telefone inexistente') do
  login.preencher_username("912308038")
  login.clicar_entrar
end