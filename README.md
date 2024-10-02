
# Projeto de Automação de API com Ruby e HTTParty

Este projeto foi desenvolvido utilizando Ruby com a biblioteca HTTParty para automação de testes de APIs. A escolha do Ruby e HTTParty se deu pela simplicidade e facilidade de escrita de testes automatizados, além da integração nativa com frameworks de teste como RSpec e Cucumber. O Ruby oferece uma sintaxe simples e legível, enquanto o HTTParty facilita a criação de requisições HTTP, lidando com diversos formatos de resposta e proporcionando uma interface limpa e direta.

## Instalação

### Pré-requisitos
- Ruby 2.7+ instalado em sua máquina.
- Bundler instalado. Se ainda não tiver, pode instalá-lo com o comando:
  ```bash
  gem install bundler
  ```

### Passos para instalar o projeto:

1. Clone o repositório:
   ```bash
   git clone <https://github.com/isabelazromanini/testeNos.git>
   ```
2. Entre no diretório do projeto:
   ```bash
   cd testeNos
   ```
3. Instale as dependências do projeto:
   ```bash
   bundle install
   ```

## Execução dos Testes

Para executar os testes, você pode rodar o seguinte comando:
```bash
cucumber
```
Esse comando irá executar todos os cenários de BDD definidos nos arquivos `.feature`.

### Estrutura do Projeto

O projeto está estruturado da seguinte forma:

- **features/**: Contém as principais funcionalidades do projeto de automação de API.
  - **class/**: Nesta pasta estão implementadas todas as classes com os métodos e construtores responsáveis pelas interações com a API. Cada classe pode representar um recurso ou um conjunto de ações específicas.
  - **spec/**: Contém os arquivos `.feature`, que são escritos em BDD utilizando a sintaxe Gherkin. Cada arquivo representa uma funcionalidade ou um conjunto de cenários de teste para um endpoint específico da API.
  - **step_definitions/**: Aqui estão os arquivos que mapeiam os passos definidos nos arquivos `.feature` para as implementações de código em Ruby. Eles conectam os cenários de BDD com os métodos das classes, permitindo que os testes sejam executados.
  - **support/**: Esta pasta contém arquivos de suporte que auxiliam na configuração do projeto.
    - **config/**: Aqui ficam os arquivos de configuração contendo as URLs dos endpoints da API que estão sendo testados. Esses arquivos centralizam os ambientes de teste (desenvolvimento, produção, etc.).
    - **data/**: Armazena os arquivos JSON utilizados para as requisições e para a validação dos esquemas de resposta da API. Esses JSONs podem conter os bodies das requisições e também os schemas esperados para validar a estrutura das respostas.

## Motivo da escolha de Ruby com HTTParty

O Ruby foi escolhido por sua sintaxe elegante e expressiva, tornando a criação de testes BDD simples e intuitiva. HTTParty, por sua vez, foi selecionado pela facilidade de uso para realizar requisições HTTP e lidar com respostas em diferentes formatos (JSON, XML, etc.). Essa combinação permite que o projeto seja mantido de maneira simples, com código limpo e organizado, favorecendo a manutenção e a escalabilidade da automação.

## Contribuição

Caso queira contribuir com este projeto, faça um fork, crie um branch para suas alterações, e envie um pull request. Fique à vontade para adicionar melhorias ou corrigir bugs!
