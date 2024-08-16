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


## Referências Bibliográficas
> Principais visões em Arquitetura de Software. Disponível em: <https://blog.infnet.com.br/arquitetura_software/principais-visoes-em-arquitetura-de-software/>. Acesso em: 13 agosto 2024.

## Bibliográfia

> Principais visões em Arquitetura de Software. Disponível em: <https://blog.infnet.com.br/arquitetura_software/principais-visoes-em-arquitetura-de-software/>. Acesso em: 05 agosto 2024.
> Spotfy Web API. Disponível em: <https://developer.spotify.com/documentation/web-api>. Acesso em: 14 ago. 2024.

## Histórico de Versão

| Versão | Data       | Descrição                                               | Autores                        | Revisores |
| ------ | ---------- | ------------------------------------------------------- | ------------------------------ | --------- |
| 1.0 | 05/08/2024 | Primeira versão | [Henrique Hida](https://github.com/HenriqueHida) |  |
