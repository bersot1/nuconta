Feature: Login
Como um usuario
Quero poder acessar o app e me manter logado
Para que eu possa ver meu saldo, as ofertas e fazer um pedido.

Cenário: Login Mockado Success
Dado que o cliente informou o CPF válido
Quando solicitar para fazer login
Entao o sistema deve enviar o usuario para a tela da Nuconta
E manter o usuario conectado ate o ponto de saida

Cenário: Login Mockado fail
Dado queu o cliente informou o CPF inválido
Entao o botão de login deverá ficar desabilitado
E uma mensagem de error no textField

