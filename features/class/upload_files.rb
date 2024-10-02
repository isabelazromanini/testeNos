# frozen_string_literal: true

# rubocop: enable

module UploadFiles
  def carregar_arquivo_ambiente
    YAML.load_file("#{Dir.pwd}/features/support/config/#{ENV['ENVIRONMENT_TYPE']}.yml")
  end

  def carregar_arquivo_json(nome_arquivo)
    arquivo_massa = File.read("#{Dir.pwd}/features/support/data/#{nome_arquivo}.json")
    JSON.parse(arquivo_massa)
  end
end