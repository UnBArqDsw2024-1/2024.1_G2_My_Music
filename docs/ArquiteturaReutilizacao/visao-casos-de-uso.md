## Visão de Casos de Uso

## Introdução

Os casos de uso descrevem como os diferentes usuários interagem com o nosso sistema, detalhando os principais cenários de uso e as funcionalidades do sistema. Ela define os atores envolvidos, seus objetivos e como o sistema responde a esses objetivos, fornecendo uma compreensão clara dos requisitos funcionais do sistema. Através da modelagem de casos de uso, identificamos e documentamos os processos essenciais que o sistema deve suportar, garantindo que todas as necessidades dos usuários sejam atendidas de maneira eficiente e eficaz.

## Metodologia

Após reunião com todos os membros, a visão de casos de uso foi apontada como extra, porém os membros Carlos Eduardo Mendes de Mesquita e Carlos Godoy optaram por documentar a mesma. Em reuniões via Google Meet, fizeram o diagrama dos casos de uso de acordo com a explicação exemplos dados pelo site Lucidchart.
 

### Casos de uso

Em um diagrama de casos de uso, os atores são representados como bonecos palitos e os casos de uso que podem ser executados são representados em formato oval na direção horizontal, como mostrado na figura 1, que é o diagrama de casos de uso elaborado para essa entrega. 

#### Tabela de Casos de Uso

##### Atores

| Número | Ator | Descrição|
| --- | --- | --- |
| 1 | Ouvinte | Usuário ouvite de músicas no My Music |
| 2 | Servidor | Servidor do My Music |
Fonte: Carlos Nacimento e Carlos Mesquita

A aplicação foi definida como possuindo apenas dois atores que interagem como a mesma, o usuário, registrado como ouvinte, e o aplicativo, registrado como servidor. 


##### Casos de uso

---- Tabela com os casos de uso
| Código | Descrição |
| --- | --- |
| US01 | Cadastra no aplicativo |
| US02 | Realiza Login no aplicativo |
| US03 | Recupera senha de usuário |
| US04 | Pesquisa uma música |
| US05 | Toca uma música |
| US06 | Pula uma música |
| US07 | Cria uma playlist |
| US08 | Salvar música em Playlist |
| US09 | Compartilhar música |

A tabela acima representa os casos de uso implementados no diagrama, decididos como os mais importantes de serem documentados por abrangerem completamente o uso do aplicativo pelo usuário, que no momento se resume ao ouvinte, o diagrama pode ser encontrado na figura 1 abaixo. 
Como explicado na referência utilizada para a criação dos casos de uso, em boa parte das documentações em que é utilizado, os casos de uso também são descritos e forma textual, o que será feito nesta parte do documento.

### US01 - Cadastra no aplicativo

Esse caso de uso se refere ao primeiro uso da aplicação pelos atores, é nele em que o login será criado e salvo para futuras utilizações do aplicativo.

### US02 - Realiza Login no aplicativo

É um caso de uso análogo ao US01, mas entra em vigor logo após a execução do mesmo, se tornando o uso mais comum do aplicativo, pois sem logar, o usuário não terá acesso às músicas salvas por ele.

### US03 - Recupera senha de usuário

É um caso de uso mais nichado, porém com grande utilidade em qualquer aplicação, permitindo que o usuário recupere o acesso a sua conta.

### US04 - Pesquisa uma música

É por meio deste US que os usuários podem encontrar e salvar músicas para escutar, juntar em playlists e compartilhar com outros usuários e não usuários.

### US05 - Toca uma música

É acionado quando o usuário decide reproduzir uma música salva ou não pelo aplicativo.

### US06 - Pula uma música 

É aplicado quando o usuário opta por pular uma música recomendada ou de alguma playlist compartilhada ou criada pelo mesmo.

### US07 - Cria uma playlist

Acionado quando uma playlist é criada por um usuário.

### US08 - Salvar música em playlist

Acionado quando se opta por salvar uma música em alguma playlist, seja a principal ou nova.

### US09 - Compartilhar música

Acionado quando o usuário quer compartilhar uma música do aplicativo com outro usuário ou não usuário.

##### Diagrama de casos de uso

![Diagrama de Casos de uso](../Assets/Diagrama-Casos-uso.png)
Figura 1: Diagrama de casos de uso(Fonte: Carlos Nascimento e Carlos Mesquita,2024)

## Bibliografia

Diagrama de casos de uso, Lucidchart, acessado em 8 e 14 de agosto de 2024, disponível em https://www.lucidchart.com/pages/pt/diagrama-de-caso-de-uso-uml

## Referências Bibliográficas

Lucidchart.(2024). Diagrama de caso de uso UML: o que é, como fazer e exemplos. Recuperado de https://www.lucidchart.com/pages/pt/diagrama-de-caso-de-uso-uml

## Histórico de Versões

|    Versão    |    Data    | Descrição | Autor(es) | Revisor(es) |
| ------------ | ---------- | --------- | --------- | ----------- |
| 1.0          | 07/08/2024 | Criação da página | [Carlos Eduardo Mendes de Mesquita](https://github.com/CarlosEduardoMendesdeMesquita) e [Carlos Godoy](https://github.com/CDGodoy) | - |
| 1.1          | 14/08/2024 | Conclusão do mkdocs da entrega(escrito via google docs) | [Carlos Eduardo Mendes de Mesquita](https://github.com/CarlosEduardoMendesdeMesquita) e [Carlos Godoy](https://github.com/CDGodoy) | - |