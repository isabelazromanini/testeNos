class LoginPage < SitePrism::Page
  include LoginModule
  set_url '/'

  element :username, 'input[id="username-input"]'
  element :btnEntrar, 'input[value="Entrar"]'
  element :password, 'input[id="password-input"]'
  element :validacaoUsuario, :xpath, '/html/body/app-root/ng-component/home-landingpage/div/div[1]/div[2]/div[2]/div[1]'
  element :validacaoMensagemErro, :xpath, '/html/body/app-root/ng-component/div/authentication-username/div/div/div/div[1]/section[2]/form/div[1]/app-input/nosid-input/div/div[2]'
  element :aceitarTodosCookies, :xpath, '//*[@id="c-right"]/a[1]'

end
