Feature: Nuconta
Como um usuario Nuconta
Quero poder ver meu saldo e as ofertas
Para que eu consiga fazer compras

Cenário: Inicial Success
Dado que o cliente entrou na tela da Nuconta
Entao deverá aparecer o saldo dele e as ofertas 

Cenário: Ver detalhes de um produto success
Dado que o cliente está na tela da Nuconta
Quando o cliente clicar para ver detalhes do produto
Entao o app deverá exibir um bottomsheet com os detalhes do produto
E um botão de confirmar produto

Cenário: Confirmar pedido success
Dado que o cliente está vendo os detalhes do produto
Quando o cliente confirmar o produto
Entao o app deverá descontar o valor do produto no saldo da sua conta
E fechar o bottomsheet

Cenário: Confirmar pedido sem saldo
Dado que o cliente está vendo os detalhes do produto
Quando o cliente confirmar o produto
Entao o app deverá mostrar um erro na tela informando saldo insufienciente
