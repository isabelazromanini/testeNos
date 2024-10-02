# frozen_string_literal: true

# rubocop:enable
class Constructor

  def cabecalho_requisicao(token)
    {
      'Authorization' => ' Bearer ' + token.to_s,
      'Content-Type' => 'application/json'
    }
  end

  def construir_consulta(url_api)
    HTTParty.get(url_api)
  end

  def construir_cadastro(token, body, url_api)
    HTTParty.post(url_api,
                  headers: cabecalho_requisicao(token),
                  body: body.to_json)
  end

  def construir_alteracao(token, body, url_api)
    HTTParty.patch(url_api,
                  headers: cabecalho_requisicao(token),
                  body: body.to_json)
  end

  def construir_exclusao(token, url_api)
    HTTParty.delete(url_api,
                 headers: cabecalho_requisicao(token))
  end
end


