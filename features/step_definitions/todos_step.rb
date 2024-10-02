#falta implementar demais cenarios de teste 

Quando('enviar requisição para consultar todas as tarefas') do
  @retorno = todos.listagem_tarefas
end

Entao('o sistema deve retornar os dados das tarefas junto ao {int}') do |codigo_esperado|
  expect(@retorno.code).to eql codigo_esperado
  todos.validar_listagem_tarefas(@retorno.body)
end