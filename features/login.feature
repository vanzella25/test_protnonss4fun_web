#language: pt

Funcionalidade: Login
    Para que eu possa comprar produtos
    Sendo um usuário previamente cadastrado
    Posso acessar o sistema com meu email e senha

    @happy
    Cenário: Login com sucesso
        Dado que esteja na tela de Login
        Quando eu faço o login com "teste181020@gmail.com" e "teste1810"
        Então vejo "Teste Teste" no menu logado

    @bad
    Esquema do Cenario: Login sem sucesso
        Dado que esteja na tela de Login
        Quando eu faço o login com <email> e <senha>
        Então devo ver a mensagem de alerta <mensagem>

        Exemplos:
        | email                     | senha     | mensagem                     |
        | "teste181020@gmail.com"   | "123456"  | "Authentication failed."     |
        | "testeamanha@gmail.com"   | "123456"  | "Authentication failed."     |
        | ""                        | "acb123"  | "An email address required." |
        | "teste181020@gmail.com"   | ""        | "Password is required."      |
        | ""                        | ""        | "An email address required." |