# language: pt
@comments
Funcionalidade: Validar funcionalidades dos endpoints de comments

@cadastro_comentarios
Esquema do Cenario: Realizar cadastro de um comentario do usuario
Dado possuir os dados do usuario <teste>
E possuir os dados do comentario 
Quando enviar requisição para cadastrar comentario do usuario
Entao o sistema deve retornar os dados do comentario criado junto ao <codigo_esperado>
Exemplos:
| codigo_esperado | teste       |
|    201          | 'sucesso'   |
|    422          | 'invalido'  |

@listagem_comentarios
Esquema do Cenario: Realizar consulta de todos os comentarios cadastrados
Quando enviar requisição para consultar todos os comentarios 
Entao o sistema deve retornar os dados dos comentarios junto ao <codigo_esperado>
Exemplos:
| codigo_esperado | 
|    200          | 

@consulta_comentarios_usuario
Esquema do Cenario: Realizar consulta de todos os comentarios cadastrados para um usuario 
Dado possuir os dados do usuario <teste>
Quando enviar requisição para consultar todos os comentarios cadastrados para um usuario
Entao o sistema deve retornar os dados de todos os comentarios cadastrados junto ao <codigo_esperado>
Exemplos:
| codigo_esperado | 
|    200          | 