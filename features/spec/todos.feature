# language: pt

@todos
Funcionalidade: Validar funcionalidades dos endpoints de todos

@cadastro_tarefa
Esquema do Cenario: Realizar cadastro de uma tarefa do usuario
Dado possuir os dados do usuario <teste>
E possuir os dados da tarefa 
Quando enviar requisição para cadastrar tarefas do usuario
Entao o sistema deve retornar os dados da tarefa criada junto ao <codigo_esperado>
Exemplos:
| codigo_esperado | teste       |
|    201          | 'sucesso'   |
|    422          | 'invalido'  |

@listagem_tarefas
Esquema do Cenario: Realizar consulta de todas as tarefas cadastradas
Quando enviar requisição para consultar todas as tarefas 
Entao o sistema deve retornar os dados das tarefas junto ao <codigo_esperado>
Exemplos:
| codigo_esperado | 
|    200          | 

@consulta_tarefas_usuario
Esquema do Cenario: Realizar consulta de todas as tarefas cadastradas para um usuario 
Dado possuir os dados do usuario <teste>
Quando enviar requisição para consultar todas as tarefas cadastradas para um usuario
Entao o sistema deve retornar os dados das tarefas cadastradas para o usuario junto ao <codigo_esperado>
Exemplos:
| codigo_esperado | 
|    200          | 







