module LoginModule
  include PageObjects

  def preencher_username (value)
    username.set(value)
  end

  def preencher_password(value)
    password.set(value)
  end

  def clicar_entrar
    btnEntrar.click
  end

  def validar_usuario 
    validacaoUsuario.text
  end 

  def validacao_mensagem_erro
    validacaoMensagemErro.text
  end

  def aceitar_todos_cookies
    wait_until_aceitarTodosCookies_visible
    aceitarTodosCookies.click
  end
end
