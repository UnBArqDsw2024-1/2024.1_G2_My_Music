# Visão de Implementação

## Introdução
Existem várias formas de se observar um sistema, conforme descrito no site da Universidade Federal de Pernambuco, "A visão da implementação é uma das cinco visões de arquitetura de um sistema. A finalidade da visão de implementação é captar as decisões de arquitetura tomadas para a implementação."(UFPE, 2024)¹. Este documento tem como objetivo alcançar os stakeholders relacionados a implementação do sistema, nele buscamos mapear de forma lógica o código fonte e diretórios do aplicativo.

## Metodologia

Após uma reunião com toda a equipe de desenvolvimento do projeto, ficou acordado que os integrantes [Limírio Guimarães](https://github.com/LimirioGuimaraes) e [Luis Miranda](https://github.com/LuisMiranda10) seriam responsáveis por documentar a visão de implementação. Eles se reuniram e mapearam a lógica e os diretórios do código-fonte. Para contribuir com o entendimento da visão de implementação, foi confeccionado um diagrama de componentes, apresentado na Figura 1.

## Visão de Implementação

<div style="text-align: center">
  <img src="../Assets/VisãodeImplementação.png" alt="Modelagem do Diagrama de Componentes" title="Título da Imagem" />
  <p>Figura 1: Modelagem da Visão de Implementação (Fonte: Limírio Guimarães e Luis Miranda, 2024)</p>
</div>

### Componentes Principais

#### O que são os componentes no DAS (Diagrama de Arquitetura de Software)?

Os componentes do diagrama foram criados de maneira baseada no [diagrama de classes](https://lucid.app/lucidchart/31c29fc7-aa1c-4aa6-9230-582034a77ddf/edit?viewport_loc=-1696%2C-1484%2C6656%2C3352%2CHWEp-vi-RSFO&invitationId=inv_8d8d08ce-dac2-47f2-92ec-4f110c1a106d). Sendo divididos em seus respectivos subsistemas, em que é visível que cada um faz uma requisição ou provê uma interface. A seguir, é descrito de maneira mais detalhada cada subsistema e seu relacionamento.

- Interface do Usuário:

- Banco de Música/Artistas:

- API de Música:

- Registro de Contas: 

#### Frontend:
- Framework: Flutter
- Linguagem: Dart
- State Management: Provider, Riverpod ou Bloc
- UI Component Library: Flutter Widgets

#### Backend:
- Framework: Flutter
- Banco de Dados: Storage normal e o Firestore Database
- Autenticação: Firebase Authentification

A seguir podemos observar na figura 2, o diagrama de componentes referente ao código fonte do projeto, que pode ser acessado [aqui](). 

## Bibliografia

1. Esquemas de visões. Ufpr.Br. Acessado em 2 de agosto de 2024, disponível em: https://www.inf.ufpr.br/silvia/ES/projeto/aulas/aula18.pdf

## Referências Bibliográficas 
1. UFPE. (2024). Implementation View. Recuperado de https://www.cin.ufpe.br/~gta/rup-vc/core.base_rup/guidances/concepts/implementation_view_E373E3B6.html.

## Histórico de versão

| Versão | Data      | Descrição | Autores | Revisor |
| :-:    | :-----:   | :------   | ----  | ------- |
| 1.0    |02/08/2024 | Criação do Documento | [Limírio Guimarães](https://github.com/LimirioGuimaraes) e [Luis Miranda](https://github.com/LuisMiranda10)| [Fulano](hh), [Link da revisão](https://github.com/linkdapagina)  |