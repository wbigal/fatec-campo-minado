# Sistemas Distribuídos - FATEC-SP

## Do que se trata?
Esta é uma aplicação desenvolvida para a disciplina de Sistemas Distribuídos da FATEC-SP. O objetivo era desenvolver uma aplicação distribuída que fosse capaz de tratar eventos como acesso e alteração de recursos compartilhados.

Mais detalhes na [wiki](https://github.com/wbigal/fatec-campo-minado/wiki) do projeto.

## Setup

A aplicação web subirá na porta `3000`, ficando então acessível através da url http://locahost:3000.

Para executar o projeto no seu ambiente de desenvolvimento você precisará atender os seguintes requisitos:

* Ter o RVM configurado e a versão 2.5.1 do Ruby já instalada
* Ter o bando de dados Postgres instalado

#### Configurar ambiente

Primeiro crie o arquivo com as variáveis de ambiente: `cp .env.sample .env`

Depois edit o arquivo `.env` com os dados do seu ambiente local.

Em seguida faça o setup do banco de dados: `rake db:create && rake db:migrate`

## Contribuindo

Utilize *FeatureBranch*. Crie um `branch` a partir do *branch* `master` para sua atividade, e ao final envie um `Pull Request` com as modificações.

### O que fazer para o código ser ceito

* Siga os padões de implementação do Ruby e do Ruby on Rails
* Utilize o Rspec para testar, o mínimo de cobertura é 97%
* Sempre execute o rubocop. Se tiver problemas o build falha
* Sempre execute o breakman. Se tiver problemas o build falha
* Sempre faça testes de interface em resolução de celular
* Se for criar uma relação entre duas tabelas, crie chave estrangeira
* Utilize constraint no banco de dados, não deixe tudo para o Rails
