# Léxicos

## Introdução

Um léxico é uma forma de representação que visa descrever os símbolos de uma linguagem através da definição de termos. No entanto, na Engenharia de Requisitos, seu propósito central é identificar as palavras ou frases específicas que têm significados particulares em um contexto social particular usado no estudo. Cada símbolo é acompanhado de sua noção, que se refere ao que o símbolo representa, e seu impacto, que descreve as implicações do símbolo ou o efeito que ele causa quando é aplicado. 

## Metodologia

Para a confeccção dos léxicos, utilizamos a notação do Léxico Ampliado da Linguagem (LAL)<a id="anchor_1" href="#REF1">¹</a>, com os conceitos explicitados na Tabela 1, já o template utilizado está presente na Tabela 2:

<center>

| Tipo do símbolo | Noção | Impacto |
|-----------------|-------|-------|
| Sujeito | Quem é o sujeito | Ações que executa |
| Verbo | Quem realiza, quando acontece e quais os procedimentos | Quais os reflexos das ações no ambiente e novos estados decorrentes |
| Objeto | Definir o objeto e identificar outros objetos com os quais ele se relaciona | Ações que podem ser aplicadas ao objeto  |
| Estado | O que indica e ações que levaram a esse estado | Identificar outros estados que podem ocorrer a partir do estado que se descreve  |

Tabela 1: Léxicos do tipo LAL (Fonte: SAYÃO e CARVALHO<a id="anchor_1" href="#REF1">¹</a>)


| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Nome do Léxico | Sinônimo | Símbolo | Descrição do efeito | Verbo/Objeto/Estado |

Tabela 2: Modelo dos léxicos (Fonte: Rafael Xavier)

</center>

## Léxicos

Os léxicos do My Music, apresentados nas tabelas 3 a 22 foram identificados a partir do uso do aplicativo e dos requisitos elicitados na etapa anterior.

### L01 - Reproduzir música

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Reproduzir música | Tocar música | Iniciar a reprodução de uma faixa de áudio | Permite ao usuário ouvir a música selecionada | Verbo |

Tabela 3: Léxico 1 (Fonte: Rafael)

</center>

### L02 - Adicionar à lista de reprodução

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Adicionar à lista de reprodução | Adicionar à fila, Enfileirar | Inserir uma música na lista de reprodução atual | A música é incluída na ordem de reprodução do usuário | Verbo |

Tabela 4: Léxico 2 (Fonte: Rafael)

</center>

### L03 - Pesquisar

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Pesquisar | Buscar | Procurar por uma música específica, artistas ou álbuns | Ajuda o usuário a encontrar músicas, artistas ou álbuns desejados | Verbo |

Tabela 5: Léxico 3 (Fonte: Rafael)

</center>

### L04 - Criar playlist

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Criar playlist | Criar lista de reprodução | Compor uma lista personalizada de músicas | Permite ao usuário organizar suas músicas de acordo com suas preferências | Verbo |

Tabela 6: Léxico 4 (Fonte: Rafael)

</center>

### L05 - Compartilhar música

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Compartilhar música | Enviar música | Divulgar uma música para outras pessoas | Permite ao usuário compartilhar músicas com amigos ou em redes sociais | Verbo |

Tabela 7: Léxico 5 (Fonte: Rafael)

</center>

### L06 - Favoritar música

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Favoritar música | Adicionar aos favoritos | Marcar uma música como favorita | Permite ao usuário acessar facilmente suas músicas favoritas | Verbo |

Tabela 8: Léxico 6 (Fonte: Rafael)

</center>

### L07 - Modo aleatório

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Modo aleatório | Embaralhar | Reproduzir músicas em uma ordem aleatória | Oferece variedade na reprodução das músicas | Estado |

Tabela 9: Léxico 7 (Fonte: Rafael)

</center>

### L08 - Letra da música

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Letra da música | Lyrics | Texto com as palavras da música | Permite ao usuário acompanhar a letra enquanto a música é reproduzida | Objeto |

Tabela 10: Léxico 8 (Fonte: Rafael)

</center>

### L09 - Configurações de áudio

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Configurações de áudio | Ajustes de som | Opções para modificar a qualidade e a equalização do áudio | Permite ao usuário personalizar a experiência sonora | Objeto |

Tabela 11: Léxico 9 (Fonte: Rafael)

</center>

### L10 - Álbum

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Álbum | Disco | Coleção de músicas organizadas por um artista ou tema | Facilita a navegação e a descoberta de músicas relacionadas | Objeto |

Tabela 12: Léxico 10 (Fonte: Rafael)

</center>

### L11 - Artista

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Artista | Cantor, grupo, banda | Indivíduo ou grupo responsável pela criação das músicas | Permite ao usuário explorar músicas de seus artistas favoritos | Sujeito |

Tabela 13: Léxico 11 (Fonte: Rafael)

</center>

### L12 - Gênero musical

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Gênero musical | Estilo musical | Categoria que classifica as características musicais de uma música | Auxilia na organização e na busca por músicas específicas | Objeto |

Tabela 14: Léxico 12 (Fonte: Rafael)

</center>

### L13 - Playlist

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Playlist | Lista de reprodução | Conjunto de músicas organizadas de acordo com uma temática ou preferência | Permite ao usuário criar coleções personalizadas de músicas | Objeto |

Tabela 15: Léxico 13 (Fonte: Rafael)

</center>

### L14 - Usuário

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Usuário | Cliente | Pessoa que utiliza o aplicativo de música | Interage com as funcionalidades do aplicativo para ouvir e gerenciar músicas | Sujeito |

Tabela 16: Léxico 14 (Fonte: Rafael)

</center>

### L15 - Recomendação de música

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Recomendação de música | Sugestão de música | Indicação de músicas com base nos gostos do usuário | Ajuda o usuário a descobrir novas músicas que possam ser do seu interesse | Verbo |

Tabela 17: Léxico 15 (Fonte: Rafael)

</center>

### L16 - Equalizador

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Equalizador | Controle de equalização | Ferramenta para ajustar o balanço entre frequências de áudio | Permite ao usuário personalizar a qualidade do som de acordo com suas preferências | Objeto |

Tabela 18: Léxico 16 (Fonte: Rafael)

</center>

### L17 - Modo offline

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Modo offline | Reprodução sem conexão | Capacidade de ouvir músicas sem a necessidade de conexão à internet | Oferece conveniência ao usuário, permitindo o acesso à música em qualquer lugar, mesmo sem internet | Estado |

Tabela 19: Léxico 17 (Fonte: Rafael)

</center>

### L18 - Podcast

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Podcast | Programa de áudio | Gravação de áudio sobre um tema específico, geralmente em formato episódico | Permite ao usuário ouvir discussões, entrevistas ou conteúdo educativo sobre diversos assuntos | Objeto |

Tabela 20: Léxico 18 (Fonte: Rafael)

</center>

### L19 - Modo escuro

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Modo escuro | Tema noturno | Esquema de cores que deixa a interface do aplicativo com tons mais escuros | Reduz o cansaço visual do usuário ao usar o aplicativo em ambientes com pouca luz | Estado |

Tabela 21: Léxico 19 (Fonte: Rafael)

</center>

### L20 - Sincronização

<center>

| Léxico         | Sinônimo | Noção   | Impacto             | Classificação       |
| -------------- | -------- | ------- | ------------------- | ------------------- |
| Sincronização | Atualização automática | Processo de atualizar automaticamente a biblioteca de músicas do usuário | Mantém a biblioteca de músicas do usuário atualizada em todos os dispositivos conectados | Verbo |

Tabela 22: Léxico 20 (Fonte: Rafael)

</center>

## Bibliografia

>Repositório: <https://requisitos-de-software.github.io/2023.1-Simplenote/modelagem/lexico/>. Acesso em: 07/04/2024.

>Repositório: <https://requisitos-de-software.github.io/2023.1-BilheteriaDigital/modelagem/lexicos/>. Acesso em: 07/04/2024.

>SERRANO, Milene. Requisitos – AULA - PROJETO E DESENHO DE SOFTWARE. Apresentação de slides. Disponível em: <https://aprender3.unb.br/pluginfile.php/2790229/mod_label/intro/Arquitetura%20e%20Desenho%20de%20software%20-%20Aula%20Projeto-DSW%20-%20Profa.%20Milene.pdf>. Acesso em: 07/04/2024.


## Referências Bibliográficas

> <a id="REF1" href="#anchor_1">1.</a> SAYÃO, Miriam, CARVALHO, Gustavo. Construção do léxico de aplicações. Information and Human Language Technology, 4th Workshop, Ribeirão Preto, 2006. Disponível em: <http://www.nilc.icmc.usp.br/til/til2006/0030.pdf>. Acesso em: 07/04/2024.

<center>

## Histórico de versão

| Versão  | Data       | Descrição                  | Autor                    | Revisor   |
|---------|------------|----------------------------|-------------|-----------|
| 1.0     | 07/04/2024 | Criação do documento | Rafael Xavier | Ana Luiza Rodrigues |

</center>
