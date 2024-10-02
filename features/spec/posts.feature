# language: pt
@posts
Funcionalidade: Validar funcionalidades dos endpoints de posts

@cadastro_publicacao
Esquema do Cenario: Realizar cadastro de uma publicação do usuario
Dado possuir os dados do usuario <teste>
E possuir os dados da publicação 
Quando enviar requisição para cadastrar publicação do usuario
Entao o sistema deve retornar os dados da publicação criada junto ao <codigo_esperado>
Exemplos:
| codigo_esperado | teste       |
|    201          | 'sucesso'   |
|    422          | 'invalido'  |

@listagem_publicacoes
Esquema do Cenario: Realizar consulta de todas as publicaçôes cadastradas
Quando enviar requisição para consultar todas as publicaçôes 
Entao o sistema deve retornar os dados das publicaçôes junto ao <codigo_esperado>
Exemplos:
| codigo_esperado | 
|    200          | 

@consulta_publicacoes_usuario
Esquema do Cenario: Realizar consulta de todas as publicaçôes cadastradas para um usuario 
Dado possuir os dados do usuario <teste>
Quando enviar requisição para consultar todas as publicaçôes cadastradas para um usuario
Entao o sistema deve retornar os dados das publicaçôes cadastradas para o usuario junto ao <codigo_esperado>
Exemplos:
| codigo_esperado | 
|    200          | 

