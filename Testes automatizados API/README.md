# Testes Automatizados - Cinema App API

Este projeto contém testes automatizados para a API do Cinema App, desenvolvidos com Robot Framework para validar os principais cenários de uso da aplicação.

## 📋 Sobre o Projeto

O projeto de automação de testes cobre os seguintes módulos da API:
- **Authentication** - Login, registro e autenticação de usuários
- **Movies** - Gerenciamento de filmes
- **Theaters** - Gerenciamento de cinemas
- **Sessions** - Gerenciamento de sessões de filmes
- **Reservations** - Sistema de reservas
- **Users** - Gerenciamento de usuários

## 🛠️ Pré-requisitos

Antes de executar os testes, certifique-se de ter instalado:

### Software Necessário:
- **Python 3.8+**
- **Robot Framework**
- **VS Code** (recomendado)
- **Git**

### Dependências Python:
```bash
pip install robotframework
pip install robotframework-requests
pip install pymongo
pip install bcrypt
pip install jsonschema
```

### Extensões VS Code (Recomendadas):
- Robot Framework Language Server

## 🏗️ Estrutura do Projeto

```
Testes automatizados API/
├── keywords/                    # Keywords específicas por módulo
│   ├── authentication_keywords.resource
│   ├── movies_keywords.resource
│   ├── theaters_keywords.resource
│   ├── sessions_keywords.resource
│   ├── reservations_keywords.resource
│   └── users_keywords.resource
├── logs/                       # Resultados dos testes
├── support/                     # Arquivos de suporte
│   ├── common/                # Keywords comuns e helpers
│   │   └── common.resource
│   ├── fixtures/              # Dados de teste
│   │   └── static/           # Arquivos JSON com payloads
│   ├── libs/                 # Bibliotecas customizadas
│   │   └── database.py       # Funções para manipulação do banco
│   └── variables/            # Variáveis globais
│   │   └── variables_api.resource
│   ├── base.robot             # Configurações base e setup/teardown
├── tests/                      # Casos de teste
│   ├── authentication_tests.robot
│   ├── movie_tests.robot
│   ├── theater_tests.robot
│   ├── sessions_tests.robot
│   ├── reservations_tests.robot
│   └── users_tests.robot
└── README.md
```

## ⚙️ Configuração

### 1. Clone o repositório
```bash
git clone <url-do-repositorio>
cd "Testes automatizados API"
```

### 2. Instale as dependências
```bash
pip install -r requirements.txt
```

### 3. Configure as variáveis de ambiente

#### Configuração do MongoDB:
1. Copie o arquivo `.env.example` para `.env`:
```bash
cp .env.example .env
```

2. Edite o arquivo `.env` com suas credenciais do MongoDB:
```env
MONGODB_URI=mongodb+srv://seu_usuario:sua_senha@seu_cluster.mongodb.net/...
MONGODB_DATABASE=test
```

#### Configuração da API:
Edite o arquivo `support/variables/variables_api.resource` se necessário:
```robot
${URL_BASE}    http://localhost:5000/api/v1
${ALIAS_BASE}    Cinema App API
```

### 4. Certifique-se de que a API está rodando
A API deve estar disponível em `http://localhost:5000`

## 🚀 Como Executar os Testes

### Executar todos os testes:
```bash
robot tests/
```

### Executar testes por módulo:
```bash
# Testes de autenticação
robot tests/authentication_tests.robot

# Testes de filmes
robot tests/movie_tests.robot

# Testes de reservas
robot tests/reservations_tests.robot

# Testes de sessões
robot tests/sessions_tests.robot

# Testes de cinemas
robot tests/theaters_tests.robot

# Testes de usuários
robot tests/users_tests.robot
```

### Executar testes por tags:
```bash
# Testes de Authentication
robot -d ./logs -i login_válido tests/                    # Login válido
robot -d ./logs -i registro_email_dup tests/              # Registro com email duplicado
robot -d ./logs -i login_inválido tests/                  # Login inválido

# Testes de Movies
robot -d ./logs -i ver_detalhes_filme tests/              # Visualizar detalhes do filme
robot -d ./logs -i criar_movie_inv tests/                 # Criar filme inválido

# Testes de Reservations
robot -d ./logs -i criar_reserva_valida tests/            # Criar reserva válida
robot -d ./logs -i obter_reserva_sem_auth tests/          # Obter reserva sem autenticação
robot -d ./logs -i criar_reserva_inv tests/               # Criar reserva inválida

# Testes de Sessions
robot -d ./logs -i criar_sessao_valido tests/             # Criar sessão válida
robot -d ./logs -i criar_sessao_invalido tests/           # Criar sessão inválida

# Testes de Theaters
robot -d ./logs -i criar_cinema_valido tests/             # Criar cinema válido
robot -d ./logs -i criar_cinema_invalido tests/           # Criar cinema inválido

# Testes de Users
robot -d ./logs -i obter_detalhes_user_por_id tests/      # Obter detalhes do usuário
robot -d ./logs -i excluir_user_por_id tests/             # Excluir usuário

# Executar múltiplas tags
robot -d ./logs -i "login_válido OR criar_reserva_valida" tests/

# Excluir testes com bugs conhecidos
robot -e bug_conhecido tests/
```

## 📊 Relatórios

Após a execução, os relatórios são gerados na pasta `logs/`:
- **report.html** - Relatório detalhado dos testes
- **log.html** - Log completo da execução
- **output.xml** - Dados em XML para integração

## 🔐 Configuração da API e Credenciais de Teste

### Pré-requisito: Cinema App API (Back-end)

**IMPORTANTE:** Para executar os testes, é necessário ter o back-end da Cinema App API rodando localmente.

#### Passos para configurar a API:

1. **Clone o repositório da API:**
```bash
git clone https://github.com/juniorschmitz/cinema-challenge-back.git
cd "cinema-challenge-back"
```

2. **Siga o passo a passo disponível no repositório da API: https://github.com/juniorschmitz/cinema-challenge-back**, para configurar dependências e banco de dados.

3. **Sempre que for executar os testes, inicie a API:**
```bash
cd "cinema-challenge-back"
npm run dev
```

4. **Verifique se a API está rodando** em `http://localhost:5000`

### Credenciais de Teste

*Para realizar os testes, são utilizadas as seguintes contas recomendadas na documentação da API:*

**Usuário Admin:**
- Email: admin@example.com
- Senha: password123

**Usuário Comum:**
- Email: user@example.com
- Senha: password123

**Repositório da API:** https://github.com/juniorschmitz/cinema-challenge-back

## 🗄️ Banco de Dados

O projeto utiliza MongoDB para alguns cenários de teste para facilitar a manipulação direta do banco de dados. As configurações estão em `support/libs/database.py`.

## 🐛 Bugs Conhecidos

Alguns testes documentam bugs conhecidos da API:
- **RESERVATIONS-BE-009**: Validação de payload não funciona adequadamente

Estes testes são marcados com a tag `bug_conhecido` e falham intencionalmente para documentar os problemas.

## 📝 Casos de Teste Implementados

### Authentication
- AUTH-BE-002: Login de usuário
- AUTH-BE-006: Registro com e-mail já existente
- AUTH-BE-007: Login com credenciais inválidas

### Movies
- MOVIE-BE-002: Visualizar detalhes do filme
- MOVIE-BE-006: Criar filme com dados inválidos

### Reservations
- RESERVATIONS-BE-004: Criar nova reserva
- RESERVATIONS-BE-007: Tentar obter reservas sem autenticação
- RESERVATIONS-BE-009: Criar reserva com payload inválido

### Sessions
- SESSIONS-BE-003: Criar nova sessão
- SESSIONS-BE-006: Criar sessão com payload inválido

### Theaters
- THEATER-BE-003: Criar novo cinema
- THEATER-BE-007: Criar cinema com dados inválidos

### Users
- USER-BE-002: Obter detalhes de usuário por ID
- USER-BE-003: Excluir usuário por ID

## 🤝 Contribuição

Para contribuir com o projeto:
1. Faça um fork do repositório
2. Crie uma branch para sua feature
3. Implemente os testes seguindo o padrão existente
4. Execute os testes para garantir que tudo funciona
5. Faça um pull request

## 📞 Suporte

Em caso de dúvidas ou problemas:
1. Verifique se todos os pré-requisitos estão instalados
2. Confirme se a API está rodando corretamente
3. Consulte os logs de execução em `logs/`
4. Verifique a documentação da API do Cinema App