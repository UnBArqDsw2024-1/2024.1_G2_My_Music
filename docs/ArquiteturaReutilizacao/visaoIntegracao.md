# 10. Visão de Integração

A Visão de Integração descreve como o sistema se conecta com APIs externas para fornecer suas funcionalidades principais. Neste projeto, a integração com a API de música do Spotify desempenha um papel crucial ao permitir o acesso a um vasto catálogo de músicas, permitindo que os usuários busquem, reproduzam e descubram novas faixas.

### 10.1 APIs Utilizadas
API de Música do Spotify: A API do Spotify é utilizada para obter informações sobre músicas, álbuns, artistas, e para reproduzir faixas diretamente na aplicação "My Music". Essa integração permite que os usuários explorem o conteúdo disponível no Spotify através de uma interface amigável e intuitiva. [2]
- **Protocolo de Comunicação:** HTTPS
- **Formatos de Dados:** JSON
- **Principais Endpoints:**
- - **GET /v1/search**: Para buscar músicas, álbuns ou artistas.
- - **GET /v1/tracks/{id}:** Para obter detalhes sobre uma faixa específica.
- - **GET /v1/albums/{id}:** Para acessar informações sobre um álbum.
- - **GET /v1/artists/{id}:** Para recuperar detalhes de um artista.
- - **POST /v1/me/player/play:** Para reproduzir uma faixa na conta do usuário.
- **Autenticação**: OAuth 2.0, utilizando tokens de acesso para autenticar as requisições.

### 10.2 Arquitetura de Integração

- **Pontos de Entrada**: O sistema "My Music" realiza chamadas à API do Spotify principalmente através dos serviços de busca e reprodução. Esses serviços são responsáveis por interagir com a API e processar os dados retornados para exibição no aplicativo.

- **Segurança e Autenticação**: Implementamos o fluxo de autenticação OAuth 2.0 para garantir que todas as comunicações com a API do Spotify sejam seguras e autenticadas. Os tokens de acesso são gerenciados de forma segura e renovados conforme necessário para manter a continuidade do serviço.

- **Gerenciamento de Limites de Requisições**: Para evitar a superação dos limites de requisições da API do Spotify, implementamos mecanismos de caching e gerenciamento de estado, garantindo que as chamadas à API sejam otimizadas e minimizadas sempre que possível.

- **Monitoramento e Logs**: Todas as interações com a API do Spotify são monitoradas e registradas para garantir a integridade e o desempenho do sistema. Logs detalhados são mantidos para auditoria e para a rápida resolução de problemas, caso ocorram falhas nas chamadas à API.

- **Mecanismos de Recuperação de Falhas**: No caso de falhas na comunicação com a API do Spotify, o sistema está preparado para realizar tentativas de reconexão e, se necessário, notificar o usuário sobre a indisponibilidade temporária de certos serviços.

### 10.3 Desafios de Integração

A integração com a API do Spotify apresentou desafios relacionados à gestão de tokens e à adaptação das funcionalidades do Spotify à interface do My Music. No entanto, através de uma abordagem cuidadosa de design e desenvolvimento, esses desafios foram superados, resultando em uma integração robusta e eficiente.

# 11. Tamanho e desempenho

É fundamental levar em consideração as características de dimensionamento do software que afetam a arquitetura e as restrições de desempenho de destino. Observando todo o projeto, os aspectos e restrições que podemos incluir, que foram percebidos são:

- **Número de usuários**: O número de usuários que utilizarão o aplicativo de streaming de música é crucial. O software deve ser dimensionado para lidar com uma grande quantidade de usuários simultaneamente e fornecer uma resposta rápida e eficaz.
- **Volume de dados**: O aplicativo pode produzir grandes volumes de dados, como playlists, preferências de usuário, e outros metadados relacionados à música. O software deve ser projetado para lidar com o armazenamento e a recuperação desses dados de forma eficiente, garantindo uma boa performance mesmo com o aumento do volume de dados.
- **Requisitos de tempo de resposta**: Os usuários esperam uma experiência fluida e responsiva ao interagir com o aplicativo. Como resultado, devem ser estabelecidas metas claras para o tempo de resposta do sistema, garantindo que consultas e operações sejam executadas de forma rápida e eficiente.
- **Escalabilidade**: À medida que o número de usuários e o volume de dados aumentam, é necessário considerar a capacidade do sistema de escalar. Para garantir que o sistema possa lidar com o aumento das demandas, a arquitetura deve ser projetada para permitir a adição de recursos adicionais, como servidores e capacidade de armazenamento.
- **Integração com sistemas existentes**: O aplicativo pode precisar se integrar com outros sistemas ou APIs internas da empresa, além de serviços de terceiros. Como resultado, a arquitetura deve ser projetada para permitir a integração segura e eficiente com esses sistemas, além de garantir uma troca adequada de funcionalidades e dados.

Isso garantirá um sistema escalável, eficaz e seguro que atenda às necessidades dos usuários e ofereça uma experiência de usuário de alta qualidade.

## Referências Bibliográficas
> Principais visões em Arquitetura de Software. Disponível em: <https://blog.infnet.com.br/arquitetura_software/principais-visoes-em-arquitetura-de-software/>. Acesso em: 13 agosto 2024.

## Bibliográfia

> Principais visões em Arquitetura de Software. Disponível em: <https://blog.infnet.com.br/arquitetura_software/principais-visoes-em-arquitetura-de-software/>. Acesso em: 05 agosto 2024.
> Spotfy Web API. Disponível em: <https://developer.spotify.com/documentation/web-api>. Acesso em: 14 ago. 2024.

## Histórico de Versão

| Versão | Data       | Descrição                                               | Autores                        | Revisores |
| ------ | ---------- | ------------------------------------------------------- | ------------------------------ | --------- |
| 1.0 | 05/08/2024 | Primeira versão | [Henrique Hida](https://github.com/HenriqueHida) |  |
