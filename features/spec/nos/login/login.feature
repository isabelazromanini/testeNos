#language: pt
@login 
Funcionalidade: Nos - Login
  Eu como QA da NOs
  Quero garantir a qualidade dos cenários referente a login

Contexto: Acessar site NOS
  Dado que acessou o site NOS

@login_sucesso_telemovel
Cenário: Realizar login com o numero do telemovel 
  Quando preencho o numero do telemovel
  E preencho o campo Senha
  Entao será realizado o login no site da NOS
   

@login_sucesso_email
Cenário: Realizar login com o e-mail 
  Quando preencho o e-mail
  E preencho o campo Senha
  Entao será realizado o login no site da NOS

@login_inexistente_email
Cenário: Realizar login com o e-mail inexistente
  Quando preencho o e-mail inexistente
  Entao será apresentado mensagem de erro "Não foi encontrado nenhum utilizador"

@login_inexistente_telefone
Cenário: Realizar login com o numero do telemovel inexistente
  Quando preencho o telefone inexistente
  Entao será apresentado mensagem de erro "Não foi encontrado nenhum utilizador"

