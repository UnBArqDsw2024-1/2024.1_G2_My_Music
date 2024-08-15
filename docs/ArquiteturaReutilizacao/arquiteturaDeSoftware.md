# Documento de Arquitetura de Software

# 1. Introdução

Neste documento, abordamos as decisões arquiteturais tomadas pelo grupo ao longo de todas as etapas até o momento. Exploramos a visão lógica, que apresenta a divisão dos pacotes, sistemas, classes e seus relacionamentos; a visão de implementação, que se concentra nos padrões e modelos aplicados durante o desenvolvimento do projeto; a visão de implantação, que considera em quais hardwares o software seria implementado; a visão de dados, que oferece uma perspectiva sobre o armazenamento das informações no sistema; e, por fim, a visão de processos, que engloba as atividades e fluxos de trabalho relacionados ao desenvolvimento, manutenção e evolução do software ao longo de seu ciclo de vida. Caso queira analisar profundamente algum dos documentos abordados, como o visão de lógica, basta clicar em seu título.[1]

# 2. Escopo

O Documento da Arquitetura de Software se aplica ao projeto do "My Music", trabalho da disciplina de Arquitetura e Desenho de Software, que consiste em uma aplicação de streaming de música.

# 3. Representação Arquitetural

Para o back-end, a linguagem escolhida para o desenvolvimento foi Dart, utilizando o framework Flutter. A escolha foi motivada pela versatilidade do Flutter em permitir o desenvolvimento de uma aplicação multiplataforma com uma única base de código, além da familiaridade dos membros do grupo com a linguagem Dart. O uso do Flutter também permite uma integração suave entre a interface do usuário e a lógica de negócios, facilitando a manutenção e evolução da aplicação.

Como modelo arquitetural, foi adotado o padrão cliente-servidor. Nesse modelo, a aplicação é dividida em dois componentes principais: o cliente, que é responsável pela interface do usuário e interação com o usuário final; e o servidor, que lida com a lógica de negócios, processamento de dados e comunicação com o banco de dados. Essa separação facilita a escalabilidade e manutenção do sistema, permitindo que cada parte seja desenvolvida, atualizada e escalada de forma independente.

# 4. Definições, Acrônimos e Abreviações

| Abreviação/Acrônimo                                           | Definição                                                                                                                                                                  |
|-------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **MVC**                                                    | Model-View-Controller: Um padrão de projeto arquitetural que separa a aplicação em três componentes principais: Modelo, Visão e Controlador.                              |
| **GRASP** - General Responsibility Assignment Software Patterns | Conjunto de padrões que oferecem diretrizes para atribuição de responsabilidades a classes e objetos em design orientado a objetos.                                      |
| **GoF** - Gang of Four                                       | Grupo de quatro autores que publicaram o livro "Design Patterns: Elements of Reusable Object-Oriented Software", contendo 23 padrões de design essenciais para o desenvolvimento de software. |
| **UML** - Unified Modeling Language                         | Linguagem de modelagem unificada utilizada para especificar, visualizar, construir e documentar artefatos de sistemas de software.                                        |
| **DAS** - Documento de Arquitetura de Software               | Representação visual que demonstra como os componentes de um sistema de software estão organizados e como interagem entre si.                                          |
| **DER** - Diagrama Entidade-Relacionamento                  | Diagrama utilizado para modelar a estrutura lógica de um banco de dados, mostrando as entidades e os relacionamentos entre elas.                                        |

# 5. [Visão Lógica](../../ArquiteturaReutilizacao/visao-de-logica.md)

<iframe height="600" width="800" src="https://unbarqdsw2024-1.github.io/2024.1_G2_My_Music/ArquiteturaReutilizacao/visao-de-logica</iframe>

# 6. [Visão de Processo](../../ArquiteturaReutilizacao/visao-de-processo.md)

<iframe height="600" width="800" src="https://unbarqdsw2024-1.github.io/2024.1_G2_My_Music/ArquiteturaReutilizacao/visao-de-processo</iframe>

# 7. [Visão de Implantação](../../ArquiteturaReutilizacao/VisaoDeImplantacao.md)

<iframe height="600" width="800" src="https://unbarqdsw2024-1.github.io/2024.1_G2_My_Music/ArquiteturaReutilizacao/VisaoDeImplantacao</iframe>

# 8. [Visão de Implementação](../../ArquiteturaReutilizacao/VisaoDeImplementacao.md)

<iframe height="600" width="800" src="https://unbarqdsw2024-1.github.io/2024.1_G2_My_Music/ArquiteturaReutilizacao/VisaoDeImplementacao</iframe>

# 9. [Visão de Dados](../../ArquiteturaReutilizacao/visaoDados.md)

<iframe height="600" width="800" src="https://unbarqdsw2024-1.github.io/2024.1_G2_My_Music/ArquiteturaReutilizacao/visaoDados</iframe>

# 10. [Visão de Integração](../../ArquiteturaReutilizacao/visaoIntegracao.md)

<iframe height="600" width="800" src="https://unbarqdsw2024-1.github.io/2024.1_G2_My_Music/ArquiteturaReutilizacao/visaoIntegracao</iframe>

# 11. Tamanho e desempenho

É fundamental levar em consideração as características de dimensionamento do software que afetam a arquitetura e as restrições de desempenho de destino. Observando todo o projeto, os aspectos e restrições que podemos incluir, que foram percebidos são:

- **Número de usuários**: O número de usuários que utilizarão o aplicativo de streaming de música é crucial. O software deve ser dimensionado para lidar com uma grande quantidade de usuários simultaneamente e fornecer uma resposta rápida e eficaz.
- **Volume de dados**: O aplicativo pode produzir grandes volumes de dados, como playlists, preferências de usuário, e outros metadados relacionados à música. O software deve ser projetado para lidar com o armazenamento e a recuperação desses dados de forma eficiente, garantindo uma boa performance mesmo com o aumento do volume de dados.
- **Requisitos de tempo de resposta**: Os usuários esperam uma experiência fluida e responsiva ao interagir com o aplicativo. Como resultado, devem ser estabelecidas metas claras para o tempo de resposta do sistema, garantindo que consultas e operações sejam executadas de forma rápida e eficiente.
- **Escalabilidade**: À medida que o número de usuários e o volume de dados aumentam, é necessário considerar a capacidade do sistema de escalar. Para garantir que o sistema possa lidar com o aumento das demandas, a arquitetura deve ser projetada para permitir a adição de recursos adicionais, como servidores e capacidade de armazenamento.
- **Integração com sistemas existentes**: O aplicativo pode precisar se integrar com outros sistemas ou APIs internas da empresa, além de serviços de terceiros. Como resultado, a arquitetura deve ser projetada para permitir a integração segura e eficiente com esses sistemas, além de garantir uma troca adequada de funcionalidades e dados.

Isso garantirá um sistema escalável, eficaz e seguro que atenda às necessidades dos usuários e ofereça uma experiência de usuário de alta qualidade.


# 12. Qualidade

Além da funcionalidade do sistema, a arquitetura de software ajuda a fornecer vários recursos, como extensibilidade, confiabilidade e portabilidade. Características como segurança, proteção e privacidade são essenciais para o sucesso e a qualidade do sistema. A seguir, passamos como cada um desses recursos é apoiado pela arquitetura de software:

- **Extensibilidade**: Ao fornecer uma estrutura flexível e modular, a arquitetura de software permite que o sistema seja extensível. Isso permite a adição fácil e eficiente de novos recursos, funcionalidades e componentes, sem impactar negativamente o restante do sistema.
- **Confiabilidade**: A confiabilidade do sistema depende da arquitetura de software. A arquitetura minimiza os efeitos de falhas em um componente específico, isolando e evitando que se propaguem por todo o sistema, dividindo o sistema em partes independentes e definindo suas interações e dependências.
- **Portabilidade**: A portabilidade do sistema é diretamente impactada pela arquitetura de software, pois permite que o sistema funcione em várias plataformas e ambientes. A arquitetura facilita a adaptação e a migração do sistema para vários sistemas operacionais e dispositivos, dividindo as preocupações específicas da plataforma em camadas ou componentes separados.
- **Segurança, proteção e privacidade**: A arquitetura de software é fundamental para garantir que o sistema seja seguro, protegido e privado. É possível implementar mecanismos de segurança como autenticação, controle de acesso, criptografia de dados, monitoramento e detecção de intrusões ao projetar uma arquitetura que se concentre nessas questões.
- **Desempenho**: O desempenho do sistema é diretamente afetado pela arquitetura de software. A arquitetura pode maximizar o desempenho do sistema, reduzir os gargalos e maximizar a eficiência dos processos, definindo corretamente as interações entre os componentes e administrando os recursos de forma eficaz.

Em resumo, o desenvolvimento de um sistema robusto, confiável, seguro e com bom desempenho depende da arquitetura de software. Ela fornece a base para a utilização de recursos além de seus próprios recursos, como extensão, confiabilidade, portabilidade e garantia de segurança, proteção e privacidade.


# 13. Bibliografia

## 13.1 Bibliografria 
1. **Conceito: Visão Lógica.** Disponível em: <https://www.cin.ufpe.br/~gta/rup-vc/core.base_rup/guidances/concepts/logical_view_C135365E.html>. Acesso em: 14 ago. 2024.
2. **Documento de Arquitetura de Software.** Disponível em: <https://unbarqdsw2023-1.github.io/2023.1_G5_ProjetoRiHappy/#/4.arquiteturareutilizacao/padroes/padroesarquiteturais>. Acesso em: 13 ago. 2024.
3. **Esquemas de visões.** Ufpr.Br. Acessado em 12 de agosto de 2024. Disponível em: <https://www.inf.ufpr.br/silvia/ES/projeto/aulas/aula18.pdf>.
4. **UFPE.** (2024). Implementation View. Recuperado de <https://www.cin.ufpe.br/~gta/rup-vc/core.base_rup/guidances/concepts/implementation_view_E373E3B6.html>. Acesso em: agosto 2024.
5. **The Unified Modeling Language Org.** Activity Diagrams, 2011. Disponível em: <https://www.uml-diagrams.org/activity-diagrams.html>. Acesso em: 12 de agosto 2024.
6. **MyMusic.** 1.1.4 Protótipo, 2024. Disponível em: <https://unbarqdsw2024-1.github.io/2024.1_G2_My_Music/Base/prototipo/>. Acesso em: 11 de agosto 2024.
7. **AULA - ARQUITETURA & DAS – PARTE II.** Serrano, Milene. Disponível em: [Aprender3](https://aprender3.unb.br/). Acesso em: 11 agosto 2024.

## 13.2 Referências bibliográficas

1. **Documento de Arquitetura de Software.** Disponível em: <https://unbarqdsw2023-1.github.io/2023.1_G5_ProjetoRiHappy/#/4.arquiteturareutilizacao/padroes/padroesarquiteturais>. Acesso em: 12 ago. 2024. [1]

2. **Spotfy Web API.**. Disponível em: <https://developer.spotify.com/documentation/web-api>. Acesso em: 14 ago. 2024. [2]

# 14. Histórico de Versão

| Versão | Data       | Descrição                                                  | Autor(es)              | Revisor(es)   |
| ------ | ---------- | ---------------------------------------------------------- | ---------------------- | ------------- |
| `1.0`  | 12/08/2024 | Criação do documento e adição de todas as visões.                 | Henrique Hida           | [Luis Miranda](https://github.com/LuisMiranda10), [Link da revisão)[https://github.com/UnBArqDsw2024-1/2024.1_G2_My_Music/pull/116]       |
| `1.1`  | 14/08/2024 | Update de correções e mudança na ordem dos tópicos    | [Henrique Hida](https://github.com/HenriqueHida)           | [Luis Miranda](https://github.com/LuisMiranda10), [Link da revisão)[https://github.com/UnBArqDsw2024-1/2024.1_G2_My_Music/pull/116]       |
