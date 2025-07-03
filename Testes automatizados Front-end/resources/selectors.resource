*** Settings ***
Documentation        Variáveis globais para selecionar algo especifício na página

*** Variables ***
# Variáveis para HomePage
${home_title}    css=main h1
${logout_button}    css=[class="btn-logout"]
${profile}    css=nav a:has-text("Perfil")

# Variáveis para LoginPage
${login_page_h1}    css=main h1
${login_page_email}    id=email
${login_page_password}    id=password
${login_page_entrar}    css=[class="btn btn-primary login-btn"]

# Variáveis para MoviePage
${movie_page_h1}    css=main h1
${movie_page_lists}    css=[class="movies-grid"]
${movie_page_cards}    css=[class="movie-card"]
${movie_page_info}    css=[class="movie-info"]
${movie_page_btn_detail}    xpath=//h3[text()="Interstellar"]/../a
${movie_page_detail_poster}    css=[class="movie-poster"]
${movie_page_detail_info}    css=[class="movie-info"]
${movie_page_detail_meta}    css=[class="movie-meta"]
${movie_page_detail_genres}    css=[class="movie-genres"]
${movie_page_detail_director}    css=[class="movie-director"]
${movie_page_detail_synopse}    css=[class="movie-synopsis"]

# Variáveis para RegistrationPage
${register_page_h1}    css=main h1
${register_page_name}    id=name
${register_page_email}    id=email
${register_page_password}    id=password
${register_page_confirm_password}    id=confirmPassword
${register_page_button}    css=[class="btn btn-primary"]
${register_page_alert}    css=[class="alert-content"]

# Variáveis para ReservationPage
${reservation_page_go_btn}    xpath=//a[normalize-space(text())="Minhas Reservas"]
${reservation_page_h1}    css=main h1
${reservation_page_id}    css=main h3 >> nth=0

# Variáveis para SessionPage
${session_page_h2}    xpath=//h2[text()="Sessões Disponíveis"]
${session_page_list}    css=[class="sessions-list"]
${session_page_date_group}    css=[class="session-date-group"]
${session_page_time}    css=[class="session-time"]
${session_page_theater}    css=[class="session-theater"]
${session_page_price}    css=[class="session-price"]
${session_page_btn_select_seat}    xpath=(//a[text()="Selecionar Assentos"])[1]
${session_page_btn_reset_seat}    css=[class="btn btn-primary btn-sm reset-seats-btn"]
${session_page_select_seat}    css=button[title*="Fileira F, Assento 4"]
${session_page_btn_payment}    css=[class="btn btn-primary checkout-button"]
${session_page_resume}    xpath=//h2[text()="Resumo do Pedido"] 
${session_page_btn_buy}    css=[class="btn btn-primary btn-checkout"]
${session_page_buy_confirmed}    css=main h1
${session_page_reservation_codig}    xpath=//span[text()="Código da Reserva:"]/following-sibling::span

# Variáveis para UserPage
${user_page_h1}    css=main h1
${user_page_h2}    xpath=//h2[text()="Informações Pessoais"]
${user_page_name}    id=name
${user_page_alert_changes}    css=[class="changed-field"]
${user_page_alert_succes}    xpath=//main//p[contains(text(), "Perfil atualizado com sucesso")]  