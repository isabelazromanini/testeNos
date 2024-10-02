Dado('possuir os dados do usuario {string}') do |teste|
  @body = users.gerar_dados(teste)
end

Quando('enviar requisição para cadastrar usuario') do
  @retorno = users.cadastrar_usuario(@token,@body)
end

Entao('o sistema deve retornar os dados do usuario criado junto ao {int}') do |codigo_esperado|
  expect(@retorno.code).to eql codigo_esperado
  if @retorno.code == 201
    expect(users.validar_cadastro_usuario(@retorno, @body)).to eql(true)
  end
end


Quando('enviar requisição para consultar todos os usuarios') do
  @retorno = users.listagem_usuarios
end

Entao('o sistema deve retornar a consulta de todos os usuarios junto ao {int}') do |codigo_esperado|
  expect(@retorno.code).to eql codigo_esperado
end


Dado('possuir os dados de um usuario') do
  @usuario = users.listagem_usuarios
end

Dado('possuir os dados para alteração {string}') do |teste|
  @body = users.gerar_dados(teste)
end

Quando('enviar requisição para alterar usuario') do
  usuario = @usuario[0]['id'].to_s
  @retorno = users.alterar_usuario(@token, @body, usuario)
end

Entao('o sistema deve retornar os novos dados do usuario junto ao {int}') do |codigo_esperado|
  expect(@retorno.code).to eql codigo_esperado
end

Quando('enviar requisição para excluir um usuario {string}') do |teste|
  usuario = @usuario[0]['id'].to_s
  @retorno = users.exclusao_usuario(@token, teste, usuario)
end

Entao('o sistema deve retornar o codigo {int}') do |codigo_esperado|
  expect(@retorno.code).to eql codigo_esperado
end

Quando('enviar requisição para consultar o usuario {string}') do |teste|
  usuario = @usuario[0]['id'].to_s
  @retorno = users.consulta_usuario(teste, usuario)
end

Entao('o sistema deve retornar os dados do usuario junto ao {int}') do |codigo_esperado|
  expect(@retorno.code).to eql codigo_esperado
end


