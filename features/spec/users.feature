# language: pt

@usuario
Funcionalidade: Validar funcionalidades dos endpoints de users


@alteracao_usuario
Esquema do Cenario: Realizar alteração de usuario
Dado possuir os dados de um usuario
E possuir os dados para alteração <teste>
Quando enviar requisição para alterar usuario
Entao o sistema deve retornar os novos dados do usuario junto ao <codigo_esperado>
Exemplos:
| codigo_esperado | teste               |
|    200          | 'genero_feminino'   |
|    200          | 'genero_masculino'  |
|    200          | 'status_inativo'    |
|    422          | 'genero_invalido'   |
|    422          | 'email_cadastrado'  |
|    422          | 'sem_email'         |
|    422          | 'sem_nome'          |
|    422          | 'sem_genero'        |
|    422          | 'sem_status'        |
|    422          | 'status_invalido'   |


@cadastro_usuario
Esquema do Cenario: Realizar cadastro de usuario
Dado possuir os dados do usuario <teste>
Quando enviar requisição para cadastrar usuario
Entao o sistema deve retornar os dados do usuario criado junto ao <codigo_esperado>
Exemplos:
| codigo_esperado | teste               |
|    201          | 'genero_feminino'   |
|    201          | 'genero_masculino'  |
|    201          | 'status_inativo'    |
|    422          | 'genero_invalido'   |
|    422          | 'email_cadastrado'  |
|    422          | 'sem_email'         |
|    422          | 'sem_nome'          |
|    422          | 'sem_genero'        |
|    422          | 'sem_status'        |
|    422          | 'status_invalido'   |


@exclusao_usuario
Esquema do Cenario: Realizar exclusão de usuario
Dado possuir os dados de um usuario
Quando enviar requisição para excluir um usuario <teste>
Entao o sistema deve retornar o codigo <codigo_esperado>
Exemplos:
| codigo_esperado | teste                  |
|    204          | 'sucesso'              |
|    404          | 'usuario_inexistente'  |



@consulta_usuario
Esquema do Cenario: Consulta usuario cadastrado
Dado possuir os dados de um usuario
Quando enviar requisição para consultar o usuario <teste>
Entao o sistema deve retornar os dados do usuario junto ao <codigo_esperado>
Exemplos:
| codigo_esperado | teste                  |
|    200          | 'sucesso'              |
|    404          | 'usuario_inexistente'  |



@listagem_usuarios
Esquema do Cenario: Consulta todos os usuarios cadastrados
Quando enviar requisição para consultar todos os usuarios 
Entao o sistema deve retornar a consulta de todos os usuarios junto ao <codigo_esperado>
Exemplos:
| codigo_esperado | 
|    200          | 



