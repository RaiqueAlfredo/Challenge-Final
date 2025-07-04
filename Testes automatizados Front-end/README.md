# 🎬 Cinema App - Testes Automatizados Frontend

## 📋 Sobre o Projeto

Este projeto contém a suíte de testes automatizados para o frontend da aplicação Cinema App, desenvolvida para validar funcionalidades críticas como autenticação, navegação, reservas de filmes e responsividade da interface.

Os testes foram implementados utilizando **Robot Framework** com **Browser Library** (Playwright), garantindo cobertura completa das funcionalidades principais da aplicação.

## 🏗️ Estrutura do Projeto

```
Testes automatizados Front-end/
├── logs/                        # Relatórios de execução (ignorado pelo Git)
├── resources/
│   ├── fixtures/
│   │   ├── auth.json             # Dados de teste para autenticação
│   ├── libs/
│   │   └── database.py           # Funções para manipulação do banco
│   │── pages/
│   │   ├── HomePage.resource     # Keywords da página inicial
│   │   ├── LoginPage.resource    # Keywords da página de login
│   │   ├── MoviePage.resource    # Keywords das páginas de filmes
│   │   ├── RegistrationPage.resource   # Keywords de registro
│   │   ├── ReservationPage.resource    # Keywords de reservas
│   │   ├── SessionPage.resource  # Keywords de sessões
│   │   └── UserPage.resource     # Keywords do perfil do usuário
│   ├── base.resource              # Keywords globais e configurações
│   ├── env.resource               # Variáveis de ambiente
│   ├── selectors.resource         # Seletores centralizados
├── tests/
│   ├── movies/
│   │   ├── movie_list.robot     # Testes de listagem de filmes
│   │   └── movie_view.robot     # Testes de visualização de filmes
│   ├── reservations/
│   │   ├── reservation_create.robot # Testes de criação de reservas
│   │   └── reservation_view.robot   # Testes de visualização de reservas
│   ├── sessions/
│   │   ├── session_reset.robot  # Testes de reset de assentos de sessões
│   │   └── session_view.robot   # Testes de visualização de sessões
│   └── users/
│   │   ├── auth_update.robot    # Testes de atualização de perfil
│   │   └── auth_view.robot      # Testes de visualização de perfil
│   ├── auth_login.robot          # Testes de autenticação
│   ├── auth_registration.robot   # Testes de cadastro
│   ├── home.robot               # Testes da página inicial
├── .env                        # Variáveis de ambiente (ignorado pelo Git)
├── .gitignore                  # Arquivos ignorados pelo Git
└── README.md                   # Este arquivo
```

## 🔧 Pré-requisitos

### Software Necessário

- **Python 3.8+** - [Download](https://www.python.org/downloads/)
- **Node.js 16+** - [Download](https://nodejs.org/) (para Playwright)
- **Git** - [Download](https://git-scm.com/)
- **MongoDB** - [Download](https://www.mongodb.com/) (para testes de banco)

### Dependências Python

```bash
pip install robotframework
pip install robotframework-browser
pip install robotframework-requests
pip install pymongo
pip install bcrypt
pip install python-dotenv
pip install faker
```

### Inicialização do Playwright

```bash
rfbrowser init
```

## 🔐 Configuração da API e Front-end

### Pré-requisito: Cinema App API (Back-end)

**IMPORTANTE:** Para executar os testes, é necessário ter o back-end da Cinema App API rodando localmente.

#### Passos para configurar a API:

1. **Clone o repositório da API:**
```bash
git clone https://github.com/juniorschmitz/cinema-challenge-back.git
cd "cinema-challenge-back"
```

2. **Siga o passo a passo disponível no repositório da API:** [https://github.com/juniorschmitz/cinema-challenge-back](https://github.com/juniorschmitz/cinema-challenge-back) para configurar dependências e banco de dados.

3. **IMPORTANTE - Configuração do arquivo seedData.js:**
   
   Para garantir compatibilidade com os testes automatizados, substitua o conteúdo do arquivo `src/utils/seedData.js` pelo código disponível em: (https://github.com/RaiqueAlfredo/Challenge-Final/Configuração para rodar localmente o Cinema App API)
   
   **Caminho do arquivo:** `cinema-challenge-back/src/utils/seedData.js`
   
   **Por que essa alteração é necessária:**
   - Garante que os usuários de teste tenham as credenciais corretas
   - Cria dados consistentes para os testes automatizados
   - Permite login com os sample users: `admin@example.com` e `user@example.com` (senha: `password123`)
   
   **Após substituir o arquivo, execute:**
   ```bash
   npm run seed
   ```

4. **Sempre que for executar os testes, inicie a API:**
```bash
cd "cinema-challenge-back"
npm run dev
```

5. **Verifique se a API está rodando** em `http://localhost:5000`

### Pré-requisito: Cinema App Frontend

**IMPORTANTE:** Para executar os testes, é necessário ter o frontend da Cinema App rodando localmente.

#### Passos para configurar o Frontend:

1. **Clone o repositório do Frontend:**
```bash
git clone https://github.com/juniorschmitz/cinema-challenge-front.git
cd "cinema-challenge-front"
```

2. **Siga o passo a passo disponível no repositório do Frontend:** [https://github.com/juniorschmitz/cinema-challenge-front](https://github.com/juniorschmitz/cinema-challenge-front) para configurar dependências.

3. **Ordem de inicialização (IMPORTANTE):**
   - **Primeiro:** Inicie o back-end
   ```bash
   cd "cinema-challenge-back"
   npm run dev
   ```
   
   - **Depois:** Inicie o frontend
   ```bash
   cd "cinema-challenge-front"
   npm run dev
   ```

4. **Verifique se o frontend está rodando** em `http://localhost:3002`

## ⚙️ Configuração do Ambiente de Testes

### 1. Clone o repositório dos testes
```bash
git clone [URL_DO_REPOSITORIO]
cd "Challenge Final/Testes automatizados Front-end"
```

### 2. Instale as dependências
```bash
pip install -r requirements.txt  # Se houver arquivo requirements.txt
# Ou instale manualmente as dependências listadas acima
```

### 3. Configure as variáveis de ambiente
Crie um arquivo `.env` na raiz do projeto:
```env
MONGODB_URI=mongodb+srv://seu_usuario:sua_senha@seu_cluster.mongodb.net/...
MONGODB_DATABASE=test
```

## 🚀 Execução dos Testes

### Executar todos os testes
```bash
robot -d ./logs tests/
```

### Executar testes por tag
```bash
# Testes de filmes
robot -d ./logs -i filmes tests/

# Testes de reserva
robot -d ./logs -i reserva tests/

# Testes de sessão
robot -d ./logs -i sessao tests/

# Testes de usuário
robot -d ./logs -i usuario tests/

# Testes de login
robot -d ./logs -i login tests/

# Testes de registro
robot -d ./logs -i cadastro tests/

# Teste de responsividade/layout
robot -d ./logs -i responsividade tests/
```

### Executar arquivo específico
```bash
robot -d ./logs tests/auth_login.robot
```

## 📊 Relatórios

Após a execução, os relatórios são gerados na pasta `logs/`:

- **report.html** - Relatório visual detalhado
- **log.html** - Log completo da execução
- **output.xml** - Dados estruturados da execução
- **screenshots/** - Capturas de tela

## 🧪 Cobertura de Testes

### Funcionalidades Testadas

- ✅ **Autenticação**
  - Login com credenciais válidas/inválidas
  - Cadastro de novos usuários
  - Logout

- ✅ **Navegação**
  - Menu principal
  - Links do footer
  - Responsividade

- ✅ **Filmes**
  - Listagem de filmes
  - Detalhes do filme

- ✅ **Reservas**
  - Criação de reservas
  - Seleção de assentos
  - Visualização de reservas

- ✅ **Perfil do Usuário**
  - Atualização de dados
  - Validações de formulário

- ✅ **Responsividade**
  - Layout mobile
  - Layout desktop

## 🏷️ Tags Disponíveis

- `filmes` - Testes de filmes
- `reserva` - Testes de reservas
- `sessao` - Testes de sessões
- `usuario` - Testes de usuário
- `login` - Testes de autenticação
- `cadastro` - Testes de registro
- `responsividade` - Teste de responsividade/layout

## 🤝 Contribuição
1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Add nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📝 Convenções

### Nomenclatura de Testes
- **Formato:** `MODULO-FE-XXX: Descrição do teste`
- **Exemplo:** `AUTH-FE-001: Login com credenciais válidas`

### Estrutura de Keywords
- **Page Objects:** Uma keyword por ação da página
- **Seletores:** Centralizados no arquivo `selectors.resource`
- **Dados:** Armazenados em arquivos JSON na pasta `fixtures/`

## 📞 Suporte
Para dúvidas ou problemas:

1. Verifique a documentação do [Robot Framework](https://robotframework.org/)
2. Consulte a documentação do [Browser Library](https://marketsquare.github.io/robotframework-browser/)
3. Abra uma issue no repositório do projeto
---