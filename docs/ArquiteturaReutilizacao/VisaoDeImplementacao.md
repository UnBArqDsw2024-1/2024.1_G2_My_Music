# Visão de Implementação

## Introdução

Existem várias formas de se observar um sistema, conforme descrito no site da Universidade Federal de Pernambuco, "A visão da implementação é uma das cinco visões de arquitetura de um sistema. A finalidade da visão de implementação é captar as decisões de arquitetura tomadas para a implementação."(UFPE, 2024)¹. Este documento tem como objetivo alcançar os stakeholders relacionados a implementação do sistema, nele buscamos mapear de forma lógica o código fonte e diretórios do aplicativo.

## Metodologia

Após uma reunião com toda a equipe de desenvolvimento do projeto, ficou acordado que os integrantes [Limírio Guimarães](https://github.com/LimirioGuimaraes) e [Luis Miranda](https://github.com/LuisMiranda10) seriam responsáveis por documentar a visão de implementação. Eles se reuniram e mapearam a lógica e os diretórios do código-fonte. Para contribuir com o entendimento da visão de implementação, foi confeccionado um diagrama de componentes, apresentado na Figura 1.

## Visão de Implementação

### Componentes Principais

#### O que são os componentes no DAS (Diagrama de Arquitetura de Software)?

Os componentes do diagrama foram criados de maneira baseada no [diagrama de componentes](https://unbarqdsw2024-1.github.io/2024.1_G2_My_Music/Modelagem/diagramaComponentes/)[diagrama de classes](https://unbarqdsw2024-1.github.io/2024.1_G2_My_Music/Modelagem/diagramaClasses/). Sendo divididos em seus respectivos subsistemas, em que é visível que cada um faz uma requisição ou provê uma interface. A seguir, é descrito de maneira mais detalhada cada subsistema e seu relacionamento.

- Interface do Usuário: temos nove componentes filhos que consitutem o subsistema "Interface Usuário". Esses componentes foram projetados de acordo com a interação que os usuários vão ter dentro do aplicativo MyMusic.

- Banco de Música/Artistas: esse subsistema tem como componente filho `BIblioteca`, que é utilizada para armazenar as músicas com seus respectivos artistas que estão disponíveis no aplicativo MyMusic.

- API de Música: o componente `PesquisaMúsica` é o componente filho do subsistema "API de Música". Essa parte é responsável por desempenhar um papel crucial nas funcionalidades de busca e recuperação de músicas.

- Registro de Contas: esse subsistema tem como único componente filho `Usuários`, no qual é responsável por gerenciar todas as operações relacionadas ao registro e manutenção das informações dos usuários do sistema.

#### O que são Relacionamentos e dependências no DAS (Diagrama de Arquitetura de Software)?

No contexto do **Diagrama de Arquitetura de Software (DAS)** do projeto **MyMusic**, os relacionamentos e dependências entre os componentes do sistema são essenciais para entender como as diferentes partes do sistema interagem entre si. Aqui está uma explicação detalhada dos principais tipos de relacionamento e dependências encontrados na visão de implementação do MyMusic:

### Interface de Usuário - Banco de Música/Artistas:
A **Interface de Usuário** é responsável por apresentar os dados dos artistas e músicas para os usuários. Ela depende do **Banco de Música/Artistas** para obter essas informações. O relacionamento aqui é de **consulta** (ou leitura), onde a interface de usuário envia requisições ao banco de dados para buscar informações relevantes, como listas de músicas, detalhes de artistas, álbuns e playlists. O **Banco de Música/Artistas** serve como a fonte primária de dados para essas operações.

### Interface de Usuário - Registro de Contas:
A **Interface de Usuário** também interage diretamente com o módulo de **Registro de Contas**. Esse relacionamento é de **autenticação** e **autorização**. Sempre que um usuário tenta acessar sua conta, fazer login, ou criar uma nova conta, a interface de usuário se comunica com o módulo de registro de contas para validar as credenciais e gerenciar sessões de usuário. Esse módulo verifica as credenciais no banco de dados de usuários e retorna as informações necessárias para a interface de usuário, permitindo ou negando o acesso.

### Banco de Música/Artistas - API de Música:
O **Banco de Música/Artistas** interage com a **API de Música** para manter os dados sincronizados e atualizados. Esse relacionamento é de **integração** e **sincronização**. A API de Música pode enviar novas informações ou atualizações para o banco de dados, como quando novos álbuns ou músicas são lançados, ou quando os metadados das músicas precisam ser atualizados. O banco de dados armazena essas informações, que são então disponibilizadas para a interface de usuário e outras partes do sistema.

Esses relacionamentos e dependências mostram como diferentes componentes do MyMusic trabalham juntos para proporcionar uma experiência coesa e funcional para o usuário, garantindo que as informações estejam sempre atualizadas e acessíveis através da interface de usuário, enquanto mantêm a segurança e integridade dos dados.

#### Frontend:
- Framework: Flutter
- Linguagem: Dart
- Design Pattern: State Management, Provider, Riverpod ou Bloc
- UI Component Library: Flutter Material

#### Backend:
- Framework: Flutter
- Banco de Dados: Storage normal e o Firestore Database
- Autenticação: Firebase Authentification

A seguir podemos observar na figura 1, o diagrama de componentes referente ao código fonte do projeto, que pode ser acessado [aqui](https://github.com/UnBArqDsw2024-1/2024.1_G2_My_Music/tree/main/my_music_code). 

### Diagrama de Componentes

<center>

Figura 1 - Primeira versão do diagrama de Implementação
![Figura 1](../assets/VisãodeImplementação.png)
Autores: [Limírio Guimarães](https://github.com/LimirioGuimaraes) e [Luis Miranda](https://github.com/LuisMiranda10)
</center>


## Bibliografia

1. Esquemas de visões. Ufpr.Br. Acessado em 2 de agosto de 2024, disponível em: https://www.inf.ufpr.br/silvia/ES/projeto/aulas/aula18.pdf

## Referências Bibliográficas 
1. UFPE. (2024). Implementation View. Recuperado de https://www.cin.ufpe.br/~gta/rup-vc/core.base_rup/guidances/concepts/implementation_view_E373E3B6.html.

## Histórico de versão

| Versão | Data      | Descrição | Autores | Revisor |
| :-:    | :-----:   | :------   | ----  | ------- |
| 1.0    |02/08/2024 | Criação do Documento | [Limírio Guimarães](https://github.com/LimirioGuimaraes) e [Luis Miranda](https://github.com/LuisMiranda10)| [Lucas Alves Vilela](https://github.com/Lucas-AV), [Link da revisão](https://github.com/UnBArqDsw2024-1/2024.1_G2_My_Music/pull/90)  |
| 2.0    |07/08/2024 | Explicação da Construção da Visão de Implementação | [Limírio Guimarães](https://github.com/LimirioGuimaraes) e [Luis Miranda](https://github.com/LuisMiranda10)| [Lucas Alves Vilela](https://github.com/Lucas-AV), [Link da revisão](https://github.com/UnBArqDsw2024-1/2024.1_G2_My_Music/pull/90)  |
| 2.1    |08/08/2024 | Explicação Relacionamento DAS | [Limírio Guimarães](https://github.com/LimirioGuimaraes) e [Luis Miranda](https://github.com/LuisMiranda10)| [Lucas Alves Vilela](https://github.com/Lucas-AV), [Link da revisão](https://github.com/UnBArqDsw2024-1/2024.1_G2_My_Music/pull/90)  |
| 2.1    |09/08/2024 | Correção do Documento | [Limírio Guimarães](https://github.com/LimirioGuimaraes) e [Luis Miranda](https://github.com/LuisMiranda10)| [Lucas Alves Vilela](https://github.com/Lucas-AV), [Link da revisão](https://github.com/UnBArqDsw2024-1/2024.1_G2_My_Music/pull/90)  |
