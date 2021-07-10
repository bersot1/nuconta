# Nuconta

Analisando o problema proposto e levando em conta todos os conceitos SOLID, boas praticas que venho estudando ao longo do tempo, tentei deixar cada camada com sua resposabilidade para facil manutenção e somente o necessário com dependencia de bibliotecas terceiras para integridade do projeto. 

Usei o Getx para gerenciar rotas nomeadas, estados e facilitar o trabalho com os observables. Provider para nos ajudar com as instancias e alguns packages para auxiliar nosso desenvolvimento, validacao de CPF, graphQL, cacheStorage.

## Iniciar o projeto

Tendo feito o download do projeto, basta rodar o ``flutter pub get`` e apertar f5 para rodar. Porém, para facilitar vou deixar uma APK na raiz do projeto.


## Camadas

Explicarei objetivamente cada camada usando um exemplo simples de Login para exemplificar nossa arquitetura.

### Domain

A camada de dominio é onde ficará as regras de negocio corporativa e da aplicação.

Não teremos codigo de fato e somente classes abstratas, quem vai dar suporte para essas classes é a camada de DATA LAYER.

Usando nosso exemplo de login, na nossa camada de DOMINIO teriamos a nossa classe abstrata (interface) chamada 'IAuthentication' e uma entidade 'AccountEntity'

![image](https://user-images.githubusercontent.com/51892738/125168147-4e3fdd00-e17a-11eb-849c-375de1b65da5.png)


Vale uma observação para a nomenclatura de interfaces quanto em colocar o prefixo 'I' ou não. Alguns condendam por ser 'desnecessário' outros não veem tanto problema assim. Atualmente, minha opinião se baseia em uma pergunta: "Porque não?". Acredito que se não ajuda o programador, também não o atrapalha. Então, se pode ajudar na leitura do codigo para um terceiro, porque não?!


### Data Layer

Data Layer, Business Logic, Application. Todos esses nomes representam a cada que terá as implementações de fato das nossas classes abstratas do domain. 

Com o desacoplamento, poderiamos facilmente, implementar uma versão de login indo até um API (remote) e/ou um login cache por ex.

![image](https://user-images.githubusercontent.com/51892738/125168332-7aa82900-e17b-11eb-886c-73e394f186c2.png)

Repare que, a classe RemoteAuthentication terá que ter uma dependencia de uma biblioteca terceira para fazer a requisição na API, porém, não seria legal acoplar essa dependencia nessa camada, pois, se hipoteticamente precisarmos alterar o package, teriamos que mexer em toda a camada DATA. Por isso, criaremos uma outra abstracao que vai ficar responsável por essa finalidade.

![image](https://user-images.githubusercontent.com/51892738/125168441-fa35f800-e17b-11eb-8350-9604dc0519f7.png)

Repare que nas principais camadas da nossa aplicação, ainda nao temos nenhuma dependencia terceira, ou seja, estamos apenas usando o DART... Seguindo o 'conceito' framework agnostic. Ou seja, a chance de mudar algo de impacto no nosso projeto é menor que se tivemos mais 1 ou mais dependencia alem do dart.

### Infra

A camada de infra é a responsável por implementar o codigo do HttpClient por ex, para dar suporte a nossa interface que criamos na camada de DATA, responsável por implementar, em outros cenários, acesso a banco local, etc.

Essa camada sim, precisa ter dependencia de uma package de requisicao, como por exemplo o proprio httpClient ou o dio. Vale ressaltar que nossa classe abstrata nao deve obdecer criteriosamante as assinatura de um package, pois o package pode mudar e não adiantará o desacoplamento. 


![image](https://user-images.githubusercontent.com/51892738/125168929-497d2800-e17e-11eb-80b8-c18d8ef58e04.png)


### Presentation

Essa camada tem por finalilidade implementar as interfaces que a camada de UI precisa para funcionar. Ela pode ter uma dependencia com bibliotecas terceiras para gerenciamento de estados, facilitar trabalhar com streams, observables, como por ex Getx, Mobx, mas é o que chamamos de dependencia fraca, pois se a biblioteca ficar defasada, so precisamos alterar essa camada. 

Seguindo o exemplo do login, nessa camada teriamos alem da implementação do LoginPresenter, teriamos que ter acesso a uma camada da validação para validarmos os dados que o usuario digitou para fazer login. Tento isso em vista e todo nosso descoplamento, fazemos uma camada também de Validation.

![image](https://user-images.githubusercontent.com/51892738/125169250-afb67a80-e17f-11eb-9ce9-1f92ea3bcdc6.png)


### Validation

Como o proprio nome sugere, essa camada vai ser responsável pela validação. De novo é uma camada que pode ter dependencia de uma biblioteca terceira, mas é uma dependencia fraca, como vimos.

![image](https://user-images.githubusercontent.com/51892738/125169346-1fc50080-e180-11eb-9fbb-dd3ec8503b9a.png)


### UI

E por fim, mas nao menos importante, temos a nossa camada de UI, que será reponsável por interagir com os usuários e pela sua história, dispensa muito apresentações rs. 

Repare que somente nessa camada temos a dependencia do flutter... Ou seja, até se flutter sofrer algum tipo de alteração, precisaremos somente mexer na camada do UI, tudo pra cima, so trabalhamos com Dart.

E por fim, mas nao menos importante, temos a nossa camada de UI, que será reponsável por interagir com os usuários. Repare que somente nessa camada temos a dependencia do flutter... Ou seja, até se flutter sofrer algum tipo de alteração, precisaremos somente mexer na camada do UI, tudo pra cima, so trabalhamos com Dart.

![image](https://user-images.githubusercontent.com/51892738/125169466-a7127400-e180-11eb-9c26-45e5f27c8af6.png)
