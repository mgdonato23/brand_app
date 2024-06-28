# Aplicação Flutter com Backend NestJS

## Descrição

Este projeto consiste em uma aplicação Flutter integrada com um backend construído com NestJS. A aplicação Flutter apresenta uma tela de login, uma tela inicial que exibe uma lista de posts e uma funcionalidade de logout. O backend NestJS fornece uma API para gerenciar os posts.

## Estrutura do Projeto

A estrutura do projeto é organizada seguindo os princípios da Arquitetura Limpa e utilizando MobX para gerenciamento de estado na aplicação Flutter.

## Funcionalidades

### Aplicação Flutter

1. **Tela de Login:**
   - Campos para e-mail e senha.
   - Validação dos campos (e-mail válido e senha com pelo menos 6 caracteres).
   - Botão de login que, ao ser clicado, valida os campos e exibe uma mensagem de erro se as credenciais forem inválidas.
   - Redirecionamento para a tela inicial após um login bem-sucedido.

2. **Tela Inicial:**
   - AppBar com o título "Bem-vindo!".
   - Botão "Logout" na AppBar que redireciona o usuário de volta para a tela de login.
   - Campo para realizar a filtragem por Marca.
   - Lista de posts obtidos da API, exibindo título e conteúdo.

### API NestJS

1. **Gerenciamento de Posts:**
   - Endpoint para obter todos os posts (`GET /posts`).

## Pré-requisitos

- Node.js e npm instalados
- Flutter SDK instalado

## Como Executar a Aplicação

### Executar a API NestJS

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/mgdonato23/brand_app.git
   cd brand_app/nest-api

2. **Instale as dependências:**

npm install

3. **Inicie o servidor:**

npm run start

A API estará disponível em http://localhost:3000. Porém, atente-se aos comentários para rodar a aplicação em Flutter.

### Executar a Aplicação Flutter

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/mgdonato23/brand_app.git
   cd brand_app/flutter_app

2. **Instale as dependências do Flutter:**

flutter pub get

3. **Gere as Stores:**

flutter packages pub run build_runner build

4. **Inicie o servidor:**

flutter run

A aplicação Flutter deve estar configurada para acessar a API, porém, procure a frase "TODO ALTERAR IP PARA O IP DA SUA MÁQUINA" no projeto e altere o "192.168.X.XXX" para o de sua máquina.
Isso acontece porque o localhost no contexto do Flutter refere-se ao próprio dispositivo em que o aplicativo está sendo executado, e não ao seu computador (onde a API NestJS está sendo executada).

Contato
Para dúvidas ou sugestões, entre em contato pelo e-mail: mg.donato23@gmail.com