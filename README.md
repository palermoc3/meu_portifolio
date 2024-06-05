# Meu Portfólio

Este é um projeto de portfólio desenvolvido em Ruby on Rails, demonstrando habilidades na criação de uma loja virtual. Inclui funcionalidades de autenticação, gerenciamento de produtos, integração com API de pagamentos Stripe, upload de imagens com Active Storage e testes automatizados. A aplicação está hospedada no Render e pode ser acessada [aqui](https://portifolio-mych.onrender.com/).

## Funcionalidades

- **Autenticação de Usuários**: Implementada com Devise.
- **Gerenciamento de Produtos e Categorias**: CRUD completo para produtos e categorias.
- **Integração com API de Pagamentos Stripe**: Processamento de pagamentos seguro e eficiente.
- **Upload e Gerenciamento de Imagens**: Utilização do Active Storage para uploads.
- **Testes Automatizados**: Cobertura de testes com RSpec e FactoryBot.
- **Interface Responsiva**: Utilização do Bootstrap para um design amigável e responsivo.

## Tecnologias Utilizadas

- **Ruby on Rails**: Framework principal para o desenvolvimento da aplicação.
- **PostgreSQL**: Banco de dados utilizado.
- **Devise**: Gem para autenticação de usuários.
- **Stripe**: API para processamento de pagamentos.
- **Active Storage**: Gerenciamento de uploads de arquivos.
- **RSpec e FactoryBot**: Ferramentas para testes automatizados.

## Como Executar o Projeto

Siga os passos abaixo para configurar e executar o projeto localmente.

### Pré-requisitos

- Ruby 3.0.0
- Rails 7.0.4.3
- PostgreSQL

### Passo 1: Clonar o Repositório

```bash
git clone https://github.com/palermoc3/meu_portifolio.git
cd meu_portifolio
```

2. Instale as dependências:

    ```bash
    bundle install
    yarn install
    ```

3.  Executar os testes e configurar o banco de dados:

    ```bash
    rspec
    rails db:create
    rails db:migrate
    rails db:seed
    ```

4. Inicie o servidor Rails:

    ```bash
    rails server
    ```

5. Acesse o projeto no seu navegador:

    ```bash
    http://localhost:3000
    ```
## Gemas e Bibliotecas Utilizadas

- **Devise**: Para autenticação de usuários.
- **Stripe**: Para integração com a API de pagamentos.
- **Active Storage**: Para upload e gerenciamento de imagens.
- **RSpec**: Para testes.
- **FactoryBot**: Para criação de objetos de teste.
- **Faker**: Para geração de dados fictícios em testes.

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE para mais detalhes.

## Contato

Para mais informações, entre em contato através do [LinkedIn](https://www.linkedin.com/in/pedro-palermo-martins-37085a140/).

Obrigado por visitar meu portfólio! Estou animado para discutir como posso contribuir para sua equipe.

