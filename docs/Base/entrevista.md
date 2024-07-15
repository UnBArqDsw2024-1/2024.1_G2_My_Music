# Entrevista

## Introdução
A entrevista é uma das técnicas mais utilizadas de coleta de dados e levantamento de requisitos. Trata-se de uma conversa guiada por um roteiro de perguntas ou tópicos, na qual um entrevistador busca obter informação de um entrevistado (Seidman1, 1998). A entrevista permite uma interação direta com os usuários para compreender suas necessidades e expectativas em relação ao sistema.

## Metodologia
A metodologia adotada para a elaboração deste artefato de elicitação de requisitos envolveu uma combinação de questões com foco na experiência atual dos usuários com aplicativos de músicas, sendo os recursos mais utilizados, problemas, experiência e impacto deste tipo de aplicação no seu dia a dia.

As entrevistas foram realizadas no dia 06/04/2024 e contou com a participação de dois usuários de aplicativos de música, que foram entrevistado pelo Vinícius Mendes, acompanhado do escrivão Luis Miranda, onde ambos construíram o roteiro juntos. Na tabela 1 pode ser visto o cronograma executado das entrevistas e as informações sobre cada uma. 

Antes do início da entrevista foi lido um termo de consentimento ao participante, para que assim possamos coletar os seus dados de forma ética e consentida, além de explicar também os motivos e objetivos da entrevista. 

A entrevista foi projetada com um roteiro de 19 perguntas abertas e fechadas, sendo 4 delas para definição de perfil e 15 com foco em elicitar requisitos em relação a aplicativos de música, assim explorando a experiência dos usuários e suas necessidades. A plataforma utilizada foi o Teams para a gravação e condução da entrevista.

Após a coleta de dados das respostas dos participantes, foram transcritas e delas elicitamos requisitos para o projeto.

### Cronograma executado

| Data       | Horário       | Entrevistado         | Entrevistador   | Escrivão        | Entrevista                           |
| ---------- | ------------- | -------------------- | --------------- | --------------- | ------------------------------------ |
| 06/04/2024 | 11:40 - 11:55 | Lucas de Paula       | Vinícius Mendes | Luis Miranda    | [Link](https://youtu.be/cGiAc7GOP58) |
| 06/04/2024 | 13:00 - 13:15 | Mateus Souza Santana | Vinícius Mendes | Vinícius Mendes | [Link](https://youtu.be/cJttnDfV3DA) |

<div style="text-align: center">
  <p>Tabela 1: Cronograma executado para a Entrevista (Elicitação de Requisitos). (Fonte: Vinícius Mendes, 2024)</p>
</div>

### Perfil dos Entrevistados

A tabela 2 contém as informações dos entrevistados, que foram no geral homens jovens e estudantes.

| Entrevistado | Gênero | Idade | Ocupação |
|--------------|--------|-------|----------|
|Lucas de Paula| Homem cis| 18| Estudante |
|Mateus Souza Santana|Homem cis| 23 | Estudante e estágio na CAESB|

<div style="text-align: center">
  <p>Tabela 2: Informações dos perfis entrevistados. (Fonte: Vinícius Mendes, 2024)</p>
</div>

## Roteiro
A estrutura da entrevista realizada foi de:
 - Apresentação - Parte essa onde o apresentador e o escrivão se apresentaram para o entrevistado e foi feita a leitura do termo de consentimento
 - Definição do Perfil - Etapa feita de perguntas para conhecer o perfil do entrevistado
 - Entrevista Principal - Etapa onde as perguntas focadas sobre experiência e necessidades do usuário em relação a aplicativos de música foram feitas
 - Comentário - Etapa feita para o entrevistado comentar algo que deixamos de foram ou que ele se sentiu a vontade de compartilhar
 - Conclusão - Final da entrevistado onde o entrevistador e o escrivão agradeceram o entrevistado pelo seu tempo e o término da gravação e entrevista. 

Logo abaixo será apresentado a tabela 3 que contém a estrutura das perguntas utilizadas para conduzir a entrevista.

| Partes     | Perguntas                                                                                                                                                                                                                                                                                                                                                                                                          |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Perfil     | 1. Qual o seu nome?<br>    <br>2. Quantos anos você tem?<br>    <br>3. Qual gênero você se identifica?<br>    <br>4. Qual a sua profissão?                                                                                                                                                                                                                                                                         |
| O que      | 1. Quais recursos você espera em um aplicativo de música? (Resposta aberta)<br>    <br>2. Quais recursos você mais utiliza? (Resposta aberta)<br>    <br>3. Quais problemas você já teve com aplicativos de música? (Resposta aberta)                                                                                                                                                                              |
| Quando     | 1. Quando você quer procurar uma música, você utiliza aplicativos de música? (Sim/Não)<br>    <br>2. Quando você precisa saber da letra de uma música, onde você procura? (Resposta aberta)                                                                                                                                                                                                                        |
| Como       | 1. Como você procura saber das novidades dos seus artistas favoritos? (Resposta aberta)<br>    <br>2. Você recomendaria músicas por aplicativo de música? (Sim/Não)<br>    <br>3. Como você procura uma música caso não saiba o nome dela ( gostaria que tivesse opção de filtros? ( álbum, etc )) (Resposta aberta)<br>    <br>4. Como você procura saber das músicas mais tocadas do momentos? (Pergunta aberta) |
| Onde       | 1. Onde você guarda suas músicas preferidas? (Resposta aberta)<br>    <br>2. Onde você escuta música? (Resposta aberta)<br>    <br>3. Por onde você explora novos gêneros musicais? (Resposta aberta)                                                                                                                                                                                                              |
| Quem       | 1. Quem são as pessoas que você espera que utilizem o aplicativo de música? (Ouvintes/Músicos/Produtores/Todos esses)                                                                                                                                                                                                                                                                                              |
| Por quê    | 1. Os aplicativos de escutar música impactaram você de alguma forma? (Pergunta aberta)<br>    <br>2. Você acha que uma experiência personalizada ( focada para seus gostos ) em um aplicativo de música é importante? (Sim/Não)                                                                                                                                                                                    |
| Comentário | 1. Você sentiu que deixamos de aborda alguma parte das suas experiências/necessidades? Se sim, quais?                                                      |

<div style="text-align: center">
  <p>Tabela 3: Estrutura das perguntas. (Fonte: Vinícius Mendes e Luis Miranda, 2024)</p>
</div>

## Requisitos Elicitados
Após a realização da entrevista com os usuários de aplicativos de músicas, foi possível elicitar requisitos apresentados na Tabela 4. Onde cada requisito é classificado por uma sigla formada por "ENT" + um número, em que "ENT" é uma sigla para entrevista, e para representar o tipo de requisito, será usado as siglas "RF" ou "RNF" que representam os Requisitos Funcionais e Não Funcionais. 

| Identificador | Requisito | Tipo |
| ------------- | --------- | ---- |
| ENT01              | Disponibilizar música          |  RF    |
| ENT02              | Salvar música          | RF     |
| ENT03              | Criar uma PlayList de música          |  RF    |
| ENT04              | Baixar a música para ouvir offline          |  RF    |
| ENT05              | Buscar música          | RF     |
| ENT06              | Ver letra de determinada música          |  RF    |
| ENT07              | Editar PlayList          |  RF    |
| ENT08              | Deletar PlayList          | RF     |
| ENT09              | Compartilhar PlayList via link          | RF     |
| ENT10              | Pesquisar PlayList          |  RF    |
| ENT11              | Salvar PlayList          | RF     |
| ENT12              | Criar um usuário          | RF     |
| ENT13              | Editar usuário          | RF     |
| ENT14              | Deletar usuário          | RF     |
| ENT15              | Pesquisar artista          | RF     |
| ENT16              | Ver perfil de artista          | RF     |
| ENT17              | Pesquisar álbum de músicas          | RF     |
| ENT18              | Filtrar pesquisa por artista/álbum/música          |  RF    |
| ENT19              | Baixar PlayList para ouvir offline         | RF     |
| ENT20              | Deve conter as músicas mais ouvidas no seu país/mundo          | RFN     |
| ENT21              | Eficiência na busca e filtragem de músicas de acordo com as preferências do usuário          | RFN     |
| ENT22              | Garantir que as músicas/PlayLists baixadas estejam disponíveis         | RFN     |
| ENT23              | Interface intuitiva para busca/filtragem de música         | RFN     |

<div style="text-align: center">
  <p>Tabela 4: Requisitos elicitados. (Fonte: Luis Miranda, 2024)</p>
</div>

## Referênciaa Bibliográfica

> SEIDMAN, I. Interviewing as Qualitative Research: a guide for researchers in Education and the Social Sciences. New York, NY: Teachers College Press, 1998

## Histórico de versões

| Versão | Data       | Descrição           | Autor(es)                      | Revisor(es) |
| ------ | ---------- | ------------------- | ------------------------------ | ----------- |
| 1.0    | 06/04/2024 | Criação do artefato | [Vinícius Mendes](https://github.com/yabamiah) e [Luis Miranda](https://github.com/LuisMiranda10) | [João Vítor](https://github.com/Jvsoutomaior)  |
| 1.1    | 12/07/2024 | Padronização das legendas das tabelas | [Ana Luíza Rodrigues](https://github.com/analuizargds) | -  |
