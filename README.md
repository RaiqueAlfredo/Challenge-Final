# 🎬 Cinema App - Challenge Final

## 📋 Sobre o Projeto

O **Cinema App Challenge Final** é um projeto completo de plano de teste e automação de testes que abrange tanto **API (Backend)** quanto **Frontend** de uma aplicação de cinema. Este projeto foi desenvolvido como parte do desafio final, demonstrando competências em planejamento, execução e automação de testes em um ambiente real de desenvolvimento.

### 🎯 Objetivos do Projeto

- **Garantir qualidade** através de testes automatizados abrangentes
- **Validar funcionalidades críticas** como autenticação, reservas e gerenciamento de filmes
- **Implementar boas práticas** de automação e documentação

## 👨‍💻 Apresentação Pessoal

**Desenvolvido por:** Raique Alfredo Pereira de Ramos  
**Cargo:** Estagiário na Compass UOL - PB AWS & AI for QE   
**Idade:** 21 anos   
**Curso:** Bacharelado em Engenharia de Software    
**Semestre:**   
**Cidade:** Imbituva - PR


## 🏗️ Estrutura do Projeto

```
Challenge Final/
├── Collection Postman para Cinema App API/
│   └── Cinema App API.postman_collection.json  # Collection Postman para testes backend
├── Plano de Testes/
│   ├── Bugs e Melhorias Relatados no Jira/     # PDFs dos bugs reportados
│   ├── Como foi relatado no Jira/              # Screenshots dos reports
│   │   ├── Back-end/                           # Evidências API
│   │   ├── Front-end/                          # Evidências Frontend
│   │   └── QAlity/                             # Evidências do QAlity
│   ├── Mapa mental do Cinema App/              # Mapas mentais do projeto
│   ├── Test Attachments para o QAlity/         # Anexos para QAlity
│   │   ├── Testes automatizados/
│   │   │   ├── Back-end/                       # Screenshots testes API
│   │   │   └── Front-end/                      # Screenshots testes Frontend
│   │   └── Testes manuais/
│   │       └── Back-end/                       # Screenshots testes manuais
│   ├── Tests Cycles QAlity Jira/               # Planilhas de ciclos de teste
│   └── Plano de Testes para Cinema App.pdf    # Documento principal do plano
├── Testes automatizados API/
│   ├── Configuração para rodar localmente o Cinema App API/
│   │   └── seedData.js                         # Arquivo de configuração do backend
│   ├── keywords/                               # Keywords pra cada arquivo de teste em tests
│   ├── logs/                                   # Relatórios de execução
│   ├── support/                                # Bibliotecas e utilitários
│   │   ├── common/                             # Resources comuns
│   │   ├── fixtures/static/                    # Dados de teste JSON
│   │   ├── libs/                               # Bibliotecas Python
│   │   └── variables/                          # Variáveis da API
│   │   └── base.robot                          # Arquivo de configuração dos testes
│   ├── tests/                                  # Casos de teste automatizados API
│   ├── README.md                               # Documentação específica da API
│   └── requirements.txt                        # Dependências
├── Testes automatizados Front-end/
│   ├── logs/                                   # Relatórios de execução
│   ├── resources/                              # Resources e page objects
│   │   ├── fixtures/                           # Dados de teste
│   │   ├── libs/                               # Bibliotecas Python
│   │   └── pages/                              # Page Objects
│   ├── tests/                                  # Casos de teste automatizados Frontend
│   │   ├── movies/                             # Testes de filmes
│   │   ├── reservations/                       # Testes de reservas
│   │   ├── sessions/                           # Testes de sessões
│   │   └── users/                              # Testes de usuários
│   ├── README.md                               # Documentação específica do Frontend
│   └── requirements.txt                        # Dependências
└── README.md                                   # Este arquivo
```

## 🛠️ Ferramentas Utilizadas

### **Planejamento e Documentação**
- **📋 Confluence** - Documentação e wiki do projeto
- **🎯 Jira** - Gerenciamento de issues e bugs
- **🧪 QAlity Plus (Jira)** - Test Management e ciclos de teste

### **Desenvolvimento e Automação**
- **🤖 Robot Framework** - Framework de automação de testes
- **📡 Postman** - Testes manuais de API e collections
- **🐍 Python** - Linguagem para bibliotecas customizadas

### **Inteligência Artificial**
- **💬 ChatGPT** - Auxílio na criação de cenários e documentação
- **🤖 Amazon Q** - Assistente de desenvolvimento e automação

## 🔧 Pré-requisitos Gerais

### Software Necessário

- **Python 3.8+** - [Download](https://www.python.org/downloads/)
- **Node.js 16+** - [Download](https://nodejs.org/)
- **Git** - [Download](https://git-scm.com/)
- **MongoDB** - [Download](https://www.mongodb.com/)
- **IDE recomendada:** VS Code com extensões Robot Framework

### Aplicações Base

Para executar os testes, você precisa ter as aplicações rodando:

1. **Cinema App API (Backend):**
   - Repository: [cinema-challenge-back](https://github.com/juniorschmitz/cinema-challenge-back)
   - Porta: `http://localhost:5000`

2. **Cinema App Frontend:**
   - Repository: [cinema-challenge-front](https://github.com/juniorschmitz/cinema-challenge-front)
   - Porta: `http://localhost:3002`

## 🚀 Como Executar os Testes

### 📡 Testes da API

Navegue até a pasta `Testes automatizados API/` e siga as instruções do README específico.

```bash
cd "Testes automatizados API"
# Siga as instruções do README.md da pasta
```

### 🌐 Testes do Frontend

Navegue até a pasta `Testes automatizados Front-end/` e siga as instruções do README específico.

```bash
cd "Testes automatizados Front-end"
# Siga as instruções do README.md da pasta
```

## 📊 Cobertura de Testes

### 🎯 Funcionalidades Testadas

#### **API (Backend)**
- ✅ **Autenticação** - Login, registro, validações
- ✅ **Usuários** - CRUD e gerenciamento de perfis
- ✅ **Filmes** - Listagem, detalhes, busca
- ✅ **Teatros** - Gerenciamento de salas
- ✅ **Sessões** - Criação e gerenciamento de sessões
- ✅ **Reservas** - Processo completo de reservas

#### **Frontend**
- ✅ **Interface de Autenticação** - Login/logout, cadastro
- ✅ **Navegação** - Menus, links, responsividade
- ✅ **Catálogo de Filmes** - Listagem e detalhes
- ✅ **Sistema de Reservas** - Seleção de assentos, confirmação
- ✅ **Perfil do Usuário** - Edição de dados, histórico
- ✅ **Responsividade** - Layout mobile, tablet, desktop

### 📈 Métricas de Qualidade

| Categoria | Testes Manuais | Testes Automatizados | Taxa de Sucesso |
|-----------|----------------|---------------------|------------------|
| **API** | 49 casos | 14 casos | 77.6% (manual) / 92.9% (auto) |
| **Frontend** | - | 17 casos | 100% |
| **Total** | 49 casos | 31 casos | 83.3% |

## 🤖 Prompts para Evolução de Testes com IA

### 📝 Para Criação de Cenários de Teste

```
Usando o seguinte cenário de teste como base:
[CENÁRIO DE TESTE EXISTENTE]

Crie um cenário de teste para o seguinte:
[INFORMAÇÕES PARA CRIAR O CENÁRIO DE TESTE]

Considere:
- Pré-condições necessárias
- Passos detalhados de execução
- Dados de teste específicos
- Resultados esperados
- Critérios de aceitação
```

### ❌ Para Criação de Cenários Negativos

```
Usando o seguinte cenário de teste como base:
[CENÁRIO DE TESTE POSITIVO]

Crie um cenário negativo para esse teste:
[INFORMAÇÕES PARA TORNAR O CENÁRIO NEGATIVO]

Foque em:
- Dados inválidos ou malformados
- Condições de erro esperadas
- Validações de segurança
- Limites e restrições do sistema
- Mensagens de erro apropriadas
```

### 🎯 Para Criação de Matriz de Risco

```
Com base nas seguintes informações sobre matriz de risco:
- "O que é Matriz de Riscos?"
- "Como fazer uma Matriz de Riscos?"

Tópicos disponíveis no link: https://ferramentasdaqualidade.org/matriz-de-riscos-matriz-de-probabilidade-e-impacto/

Crie uma matriz de risco em forma de tabela para os seguintes cenários de teste:
[CENÁRIOS DE TESTE]

Considere:
- Probabilidade de falha (Alta/Média/Baixa)
- Impacto no negócio (Alto/Médio/Baixo)
- Prioridade de execução
- Estratégias de mitigação
```

### 📋 Para Preenchimento de Test Management

```
Com base no seguinte Test Case:
[TEST CASE DETALHADO]

Preencha as colunas de "Test Step", "Test Data" e "Expected Result" do QAlity Plus - Test Management no Jira.

Formato esperado:
- Test Step: Ação específica a ser executada
- Test Data: Dados necessários para o teste
- Expected Result: Resultado esperado detalhado

Mantenha:
- Clareza e objetividade
- Rastreabilidade
- Reprodutibilidade
```
## 🤝 Agradecimentos e Colaborações

### 👥 Equipe e Colaboradores

**[Esta seção será preenchida com os nomes dos colegas que contribuíram]**

- **[Nome do Colega 1]** - Contribuição em [área específica]
- **[Nome do Colega 2]** - Apoio em [área específica]
- **[Nome do Mentor/Lead]** - Orientação técnica e revisões
- **[Nome da Equipe]** - Suporte e feedback durante o desenvolvimento

### 🙏 Reconhecimentos Especiais

- **Equipe de Desenvolvimento** - Por fornecer APIs estáveis e documentação
- **Product Owner** - Por definir critérios de aceitação claros
- **Scrum Master** - Por facilitar o processo e remover impedimentos
- **Comunidade Robot Framework** - Por recursos e documentação excelentes

## 📞 Suporte e Contato

### 🔗 Links Úteis

- **Documentação Robot Framework:** [robotframework.org](https://robotframework.org/)
- **Browser Library:** [marketsquare.github.io/robotframework-browser](https://marketsquare.github.io/robotframework-browser/)
- **Requests Library:** [github.com/MarketSquare/robotframework-requests](https://github.com/MarketSquare/robotframework-requests)

### 📧 Para Dúvidas ou Sugestões

1. Abra uma issue no repositório do projeto
2. Consulte a documentação específica de cada módulo
3. Verifique os logs de execução na pasta `logs/`

## 📝 Convenções e Padrões

### **Nomenclatura de Testes**
- **API:** `MODULO-BE-XXX: Descrição do teste`
- **Frontend:** `MODULO-FE-XXX: Descrição do teste`

### **Padrões de Código**
- **Keywords:** CamelCase para ações, snake_case para variáveis
- **Seletores:** Centralizados em arquivos resource
- **Dados:** Armazenados em arquivos JSON
---
*Este projeto representa não apenas código e testes, mas um compromisso com a excelência em qualidade de software.*