# Nuconta

Analisando o problema proposto e levando em conta todos os conceitos SOLID, boas praticas que venho estudando ao longo do tempo, tentei deixar cada camada com sua resposabilidade para facil manutenção e somente o necessário com dependencia de bibliotecas terceiras para integridade do projeto. 

Usei o Getx para gerenciar rotas nomeadas, estados e facilitar o trabalho com os observables. Provider para nos ajudar com as instancias e alguns packages para auxiliar nosso desenvolvimento, validacao de CPF, graphQL, cacheStorage.

## Iniciar o projeto

Tendo feito o download do projeto, basta rodar o ``flutter pub get`` e apertar f5 para rodar. Porém, para facilitar vou deixar uma APK na raiz do projeto.

## Explicando a arquitetura proposta

A imagem a seguir mostra as camadas da nossa aplicação. Observe que está tudo com sua devida resposabilidade... UI, presentation, data, domain, etc... mirando o desacoplamento.

![image](https://user-images.githubusercontent.com/51892738/125130443-601c7400-e0d7-11eb-940e-14e0dd25bbd3.png)

Ex: a imagem abaixo mostro como ficou nossa pasta de presenters. Presenters é responsável por implementar as interface (abstract class) que pages precisam. Ou seja, a camada da VIEW não conhece o que acontece 'por baixo dos panos' quando pede, por ex, para autenticar o usuário... Essa responsabilidade é do presenter.

![image](https://user-images.githubusercontent.com/51892738/125130648-b8ec0c80-e0d7-11eb-8844-c2674633f1ce.png)

Outro exemplo bom para entendermos o beneficio disso é imaginar uma situacao que voce trabalha com Sharedpreferences e por algum motivo (mudanças no projeto, atualizacao do package,etc) você vai precisar trocar para um SQLIte, Hiva, ou qualquer outro, se o projeto estiver com essa estrutura, voce so precisa mexer na camada de infra, que é onde implementamos as interfaces da camada DATA. 

![image](https://user-images.githubusercontent.com/51892738/125131007-69f2a700-e0d8-11eb-82ff-9a408bd8f44d.png)

Vale lembrar que para fazer o 'ligamento' de todas essas camadas, utilizei factories no meu Main, ou seja, a camada MAIN tem conhecimento de todas as outras, para gerenciar cada 'dependencia' e facilitar caso haja alguma mudança. 



