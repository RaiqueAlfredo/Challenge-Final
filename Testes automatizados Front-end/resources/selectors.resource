*** Settings ***
Documentation        Variáveis globais para selecionar algo especifício na página

*** Variables ***
# Variáveis para LoginPage
${login_page_h1}    css=main h1
${login_page_email}    id=email
${login_page_password}    id=password
${login_page_entrar}    css=[class="btn btn-primary login-btn"]

# Variáveis para HomePage
${home_title}    css=main h1
${logout_button}    css=[class="btn-logout"]