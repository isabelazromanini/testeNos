#falta implementar demais cenarios de teste 
# frozen_string_literal: true

require_relative "#{Dir.pwd}/features/class/upload_files.rb"
require_relative "#{Dir.pwd}/features/class/constructor.rb"


class Todos < Constructor
  include UploadFiles

  def listagem_tarefas
    url_consultar_todas_tarefas = carregar_arquivo_ambiente['url_todos']['url_consultar_todas_tarefas']
    retorno = construir_consulta(url_consultar_todas_tarefas)
    retorno
  end

  
  def validar_listagem_tarefas(retorno)
    # Se o retorno for uma string, converte-o para um objeto Ruby (Array de Hashes)
    retorno = JSON.parse(retorno) if retorno.is_a?(String)
  
    schema = carregar_arquivo_json('schema_listagem_todos') # Carrega o schema
    valid_schema = true
  
    # Validação do schema
    begin
      JSON::Validator.validate!(schema, retorno)
      puts "JSON está em conformidade com o esquema!"
    rescue JSON::Schema::ValidationError => e
      valid_schema = false
      puts "Erro de validação no JSON: #{e.message}"
      puts "Local do erro: #{e.path}" if e.respond_to?(:path)
    end
  
    # Verificação se todos os itens têm status "completed"
    all_completed = retorno.all? { |item| item['status'] == 'completed' }
  
    unless all_completed
      puts "Nem todos os itens possuem o status 'completed'."
    end
  
    # Validação do campo "due_on"
    valid_due_on = true
    retorno.each do |item|
      begin
        DateTime.parse(item['due_on']) # Tenta converter o campo "due_on" para um objeto DateTime
      rescue ArgumentError => e
        valid_due_on = false
        puts "Erro de validação no campo 'due_on' para o item com ID #{item['id']}: #{e.message}"
      end
    end
  
    if valid_due_on
      puts "Todos os campos 'due_on' são válidos."
    else
      puts "Alguns campos 'due_on' são inválidos."
    end
  
    # Retorna um hash com o resultado das validações
    {
      valid_schema: valid_schema,
      all_completed: all_completed,
      valid_due_on: valid_due_on
    }
  end
  
  
  

end