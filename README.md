# Nuconta

Analisando o problema proposto levando em consideração todos os conceitos SOLID e boas práticas que venho estudando ao longo do tempo, tentei deixar cada camada com sua responsabilidade para facilitar a manutenção e somente o necessário com dependência de bibliotecas terceiras para integridade do projeto. 

Usei o Getx para gerenciar rotas, estados e facilitar o trabalho com os observables, e Provider para nos ajudar com as instâncias e alguns packages para auxiliar nosso desenvolvimento, validação de CPF, graphQL e cacheStorage.

## Iniciar o projeto

Tendo feito o download do projeto, basta rodar o ``flutter pub get`` e apertar f5. Porém, para facilitar, deixarei uma APK na raiz do projeto.


## Camadas

Explicarei objetivamente cada camada usando um exemplo simples de Login para exemplificar nossa arquitetura.

### Domain

Ficará na camada de domínio as regras de negócio da aplicação.

Não teremos código de fato nessa camada, teremos somente classes abstratas. Quem dará suporte para essas interfaces é a camada de DATA LAYER.

Usando nosso exemplo de login, na nossa camada de DOMINIO, teremos a nossa classe abstrata (interface) chamada 'IAuthentication' e uma entidade 'AccountEntity'

![image](https://user-images.githubusercontent.com/51892738/125168147-4e3fdd00-e17a-11eb-849c-375de1b65da5.png)


### Data Layer

Data Layer, Business Logic, Application. Todos esses nomes representam a camada que terá as implementações de fato das nossas classes abstratas do domain. 

Com o desacoplamento, poderiamos facilmente implementar uma versão de login indo até um API (remote) e/ou um login cache por exemplo.

![image](https://user-images.githubusercontent.com/51892738/125168332-7aa82900-e17b-11eb-886c-73e394f186c2.png)

Repare que, a classe RemoteAuthentication terá uma dependência de uma biblioteca terceira para fazer a requisição na API, porém, não seria legal acoplar essa dependência nessa camada, pois, se hipoteticamente precisarmos alterar o package, teriamos que mexer em toda a camada DATA. Por isso, criaremos uma outra abstração que ficará responsável por essa finalidade.

![image](https://user-images.githubusercontent.com/51892738/125168441-fa35f800-e17b-11eb-8350-9604dc0519f7.png)

Nas principais camadas da nossa aplicação, ainda não temos nenhuma dependência terceira, ou seja, estamos apenas usando o Dart, seguindo o framework agnostic. Isto significa que a chance de mudar algo de impacto no nosso projeto é menor que se tivermos mais de uma dependência além do dart.

### Infra

A camada de infra é a responsável por implementar o código do IHttpClient para dar suporte a nossa interface que criamos na camada de DATA e responsável por implementar, em outros cenários, acesso a banco local, etc.

Essa camada sim, pode ter dependência de uma package de requisição, como por exemplo o próprio httpClient ou o dio. Vale ressaltar que nossa classe abstrata não deve obdecer criteriosamante as assinaturas de um package, pois o package pode mudar e não adiantará o desacoplamento. 


![image](https://user-images.githubusercontent.com/51892738/125168929-497d2800-e17e-11eb-80b8-c18d8ef58e04.png)


### Presentation

Essa camada tem por finalilidade implementar as interfaces que a camada de UI precisa para funcionar. Ela pode ter uma dependência com bibliotecas terceiras para gerenciamento de estados, facilitar o trabalho com streams, observables, como por exemplo, Getx, Mobx. Porém chamamos de dependência fraca, pois se a biblioteca ficar defasada, só precisamos alterar essa camada. 

Seguindo o exemplo do login, nessa camada teríamos alem da implementação do LoginPresenter, acesso a uma camada de 'validation' para validarmos os dados que o usuario digitou para fazer login.

![image](https://user-images.githubusercontent.com/51892738/125169250-afb67a80-e17f-11eb-9ce9-1f92ea3bcdc6.png)


### Validation

Como o próprio nome sugere, essa camada será responsável pela validação. De novo é uma camada que pode ter dependência de uma biblioteca terceira, mas é uma dependência fraca, como vimos.

![image](https://user-images.githubusercontent.com/51892738/125169346-1fc50080-e180-11eb-9fbb-dd3ec8503b9a.png)


### UI

Por fim, temos a nossa camada de UI, que será responsável por interagir com os usuários.

Repare que somente nessa camada temos a dependência do flutter. Ou seja, se até o flutter sofrer algum tipo de alteração, precisaremos somente mexer na camada do UI, pois todas as outras camadas estão desenvolvidas com o Dart.

![image](https://user-images.githubusercontent.com/51892738/125169466-a7127400-e180-11eb-9c26-45e5f27c8af6.png)














