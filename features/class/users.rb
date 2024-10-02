# frozen_string_literal: true

require_relative "#{Dir.pwd}/features/class/upload_files.rb"
require_relative "#{Dir.pwd}/features/class/constructor.rb"


class Users < Constructor
    include UploadFiles

    def gerar_dados(teste)
      dado = carregar_arquivo_json('body_users')
      dado['name'] = Faker::Name.initials
      dado['email'] = Faker::Internet.email
      case teste
      when "genero_feminino" 
        dado['gender'] = "female"
      when "genero_masculino"
        dado['gender'] = "male"
      when "status_inativo"
        dado['status'] = "inactive"
      when "genero_invalido"
        dado['gender'] = "teste"
      when "email_cadastrado"
        email = listagem_usuarios[1]['email'].to_s
        dado['email'] = email
      when "sem_email"
        dado['email'] = ""
      when "sem_nome"
        dado['name'] = ""
      when "sem_genero"
        dado['gender'] = ""
      when "sem_status"
        dado['status'] = ""
      when "status_invalido"
        dado['status'] = "teste"
      else
        puts "Opção não implementada!"
      end
      dado
    end

    def cadastrar_usuario(token, teste)
      url_cadastro_usuario = carregar_arquivo_ambiente['url_users']['url_cadastro_usuario']
      retorno = construir_cadastro(token, teste, url_cadastro_usuario)
      retorno
    end

    
    def alterar_usuario(token, teste, usuario)
      url_alteracao_usuario = carregar_arquivo_ambiente['url_users']['url_alteracao_usuario']
      #usuario = listagem_usuarios[0]['id'].to_s
      url_alteracao_usuario = url_alteracao_usuario.gsub('{idUsuario}' , usuario)
      retorno = construir_alteracao(token, teste, url_alteracao_usuario)
      retorno
    end

    def validar_cadastro_usuario(response, envio)
      response['name'] == envio['name']
      response['email'] == envio['email']
      response['gender'] == envio['gender']
      response['status'] == envio['status']
    end

    def listagem_usuarios
      url_listagem_usuarios = carregar_arquivo_ambiente['url_users']['url_listagem_usuarios']
      retorno = construir_consulta(url_listagem_usuarios)
      retorno
    end

    def exclusao_usuario(token, teste, usuario)
      url_exclusao_usuario = carregar_arquivo_ambiente['url_users']['url_exclusao_usuario']
      if teste == "sucesso"
        url_exclusao_usuario = url_exclusao_usuario.gsub('{idUsuario}' , usuario)
      else 
        url_exclusao_usuario = url_exclusao_usuario.gsub('{idUsuario}' , '123456')
      end
      retorno = construir_exclusao(token, url_exclusao_usuario)
      retorno
    end

    def consulta_usuario(teste, usuario)
      url_consulta_usuario = carregar_arquivo_ambiente['url_users']['url_consulta_usuario']
      if teste == "sucesso"
        url_consulta_usuario = url_consulta_usuario.gsub('{idUsuario}' , usuario)
      else 
        url_consulta_usuario = url_consulta_usuario.gsub('{idUsuario}' , '123456')
      end
      retorno = construir_consulta(url_consulta_usuario)
      retorno
    end 

end