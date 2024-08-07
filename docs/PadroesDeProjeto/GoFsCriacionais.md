O padrão GoF criacional tem como objetivo simplificar a criação de objetos, fornecendo mecanismos que tornam um sistema independente e flexível em relação a como seus objetos são criados, suas estruturas internas e suas representações. O GoF criacional inclui cinco padrões: Singleton, Factory Method, Abstract Factory, Builder, Prototype e Object Pool.

No contexto do nosso projeto, focaremos nos padrões Factory Method e Singleton.

## 3.1.0 Factory Method

## Introdução
O Factory Method é um padrão criacional que cria um padrão de instanciar uma superclasse, porém, dá a responsabilidade de definir o seu tipo para as subclasses. É um padrão muito utilizado em bibliotecas, como de inteface gráfica onde geralmente existe uma padrão para criar uma superclasse, mas, só no contexto da aplicação (no caso pode ser onde essa interface irá ser executada) que será definido o tipo pela suas subsclasses.
As classes participantes deste padrão serão explicado logo abaixo, juntamente com a imagem da figura 1, que apresenta sua estrutura através de um diagrama.

- Product(Produto abstrato) - Define uma interface para objetos criados pelo método de fábrica
- ConcetreProduct (Produto concreto) - Implementa a interface do produto
- Creator(Criador abstrato) - Possui o método FactoryMethod, que retorna um objeto Product. Pode chamar o método gerador para criar objetos Produto.
- ConcretCreater(Criador concreto) - Substituí o método de geração para criar objetos da classe ConcetreProduct

Usamos o padrão Factory Method, segundo Hugo Bonifácio Ribeiro e Tiago Abilio de Oliveira Gomes Serapião (2004, p. 39) quando:

- Uma classe não pode antecipar a classe de objetos a ser criada;
- Uma classe quer que suas subclasses especifiquem os objetos a serem
criados;
- Classes delegam responsabilidades para uma dentre outras várias
subclasses auxiliares, e você quer localizar qual subclasse auxiliar é
delegada.  

<div style="text-align: center">
  <img src="../../Assets/EstruturaFactoryMethod.png" alt="Estrutura do Factory Method" title="Título da Imagem" />
  <p>Figura 1: Estrutura do padrão Factory Method (Fonte: Refactoring Guru, 2014-2024)¹</p>
</div>


## Metodologia

Antes de descrever como foi realizada a modelagem e a implementação dos padrões criacionais utilizados, é importante ressaltar como a equipe foi organizada para a realização deste artefato. Foi criado um subgrupo composto por quatro pessoas: [Limírio Guimarães](https://github.com/LimirioGuimaraes), [Luis Miranda](https://github.com/LuisMiranda10), [Milena Baruc](https://github.com/MilenaBaruc) e [Vinícius Mendes](https://github.com/yabamiah). Todos participaram ativamente através de discussões em grupo e na realização das atividades.

Para o desenvolvimento da modelagem do Factory Method no contexto do nosso projeto, realizamos uma reunião em grupo para discutir onde e como o padrão poderia ser aplicado. A vídeo dessa reunião pode ser acessada [aqui](https://youtu.be/okhCMuSxa2w). Durante essa reunião, utilizamos dois sites como referências teóricas para termos um embasamento adequado.

Decidimos que poderíamos utilizar o padrão Factory Method na criação da classe abstrata `Perfil`. Essa superclasse possui duas subclasses, `Usuário` e `Artista`, cujas instâncias mudam conforme o contexto, permitindo funcionalidades diferentes no aplicativo para cada tipo de perfil. A modelagem foi realizada pelos membros [Luis Miranda](https://github.com/LuisMiranda10) e [Vinícius Mendes](https://github.com/yabamiah), conforme visualizado na Figura 2.

<div style="text-align: center">
  <img src="../../Assets/ModelagemFactoryMethod.png" alt="Modelagem do padrão Factory Method" title="Título da Imagem" />
  <p>Figura 2: Modelagem do padrão Factory Method (Fonte: Luis Miranda e Vinícius Mendes, 2024)</p>
</div>

O desenvolvimento da implementação foi realizado em paralelo com a modelagem, sendo conduzido pelos mesmos membros da equipe. Esta implementação foi feita de forma colaborativa através da plataforma Discord, utilizando como referência o site [Dart Academy](https://dart.academy/creational-design-patterns-for-dart-and-flutter-factory-method/)², que possui exemplos de implementações em diversas linguagens de programação.

Primeiro, foi criado um código para entender de maneira simplificada a lógica e a estrutura do código, que pode ser visualizado no Código 1. Em seguida, o código foi traduzido para a linguagem Dart, escolhida pela equipe para o desenvolvimento do projeto.

```dart
import 'dart:io';

class Objects {
  String nome;
  String tipo;
  List<String> tags;

  Objects({required this.nome, required this.tipo, required this.tags});

  // Método para adicionar uma nova tag ao interesse
  void addTag(String tag) {
    tags.add(tag);
  }

  // Método para remover uma tag do interesse
  bool removeTag(String tag) {
    return tags.remove(tag);
  }

  // Método para formatar os interesses como uma string
  @override
  String toString() {
    return 'Nome: $nome, Tipo: $tipo, Tags: ${tags.join(", ")}';
  }
}

class Configuracoes {
  bool _notificacoes;
  bool _modoOffline;
  String _tema;

  Configuracoes({bool notificacoes = true, bool modoOffline = true, String tema = "light"}) : 
    _notificacoes = notificacoes,
    _modoOffline = modoOffline,
    _tema = tema;

  bool get notificacoes => _notificacoes;
  bool get modoOffline => _modoOffline;
  String get tema => _tema;

  set notificacoes(bool notificacoes) {
    _notificacoes = notificacoes;
  }

  set modoOffline(bool modoOffline) {
    _modoOffline = modoOffline;
  }

  set tema(String tema) {
    _tema = tema;
  }

  @override
  String toString() {
    return 'Notificações: $notificacoes, Modo Offline: $modoOffline, Tema: $tema';
  }
}

abstract class Perfil {
  String? _nome;
  String? _email;
  String? _senha;
  DateTime? _dataDeNascimento;
  String? _genero;

  Perfil(this._nome, this._email, this._senha, this._dataDeNascimento, this._genero);

  String? get nome => _nome;
  String? get email => _email;
  String? get senha => _senha;
  DateTime? get dataDeNascimento => _dataDeNascimento;
  String? get genero => _genero;

  set nome(String? nome) {
    _nome = nome;
  }

  set email(String? email) {
    _email = email;
  }

  set senha(String? senha) {
    _senha = senha;
  }

  set dataDeNascimento(DateTime? dataDeNascimento) {
    _dataDeNascimento = dataDeNascimento;
  }

  set genero(String? genero) {
    _genero = genero;
  }

  String get dataFormatada {
    return _dataDeNascimento != null
        ? '${_dataDeNascimento!.day.toString().padLeft(2, '0')}/${_dataDeNascimento!.month.toString().padLeft(2, '0')}/${_dataDeNascimento!.year}'
        : 'Data não definida';
  }
}

class Usuario extends Perfil {
  List<Objects>? _interesse;
  Configuracoes? _configuracoes;

  Usuario(String nome, String email, String senha, DateTime dataDeNascimento, String genero, this._interesse, this._configuracoes)
      : super(nome, email, senha, dataDeNascimento, genero);

  List<Objects>? get interesse => _interesse;
  Configuracoes? get configuracoes => _configuracoes;

  set interesse(List<Objects>? interesse) {
    _interesse = interesse;
  }

  set configuracoes(Configuracoes? configuracoes) {
    _configuracoes = configuracoes;
  }
}

class Artista extends Perfil {
  String? _nomeArtista;
  String? _biografia;
  String? _paisDeOrigem;

  Artista(String nome, String email, String senha, DateTime dataDeNascimento, String genero, this._nomeArtista, this._biografia, this._paisDeOrigem)
      : super(nome, email, senha, dataDeNascimento, genero);

  String? get nomeArtista => _nomeArtista;
  String? get biografia => _biografia;
  String? get paisDeOrigem => _paisDeOrigem;

  set nomeArtista(String? nomeArtista) {
    _nomeArtista = nomeArtista;
  }

  set biografia(String? biografia) {
    _biografia = biografia;
  }

  set paisDeOrigem(String? paisDeOrigem) {
    _paisDeOrigem = paisDeOrigem;
  }
}

abstract class CriadorPerfil {
  Perfil criarPerfil(String nome, String email, String senha, DateTime dataDeNascimento, String genero);
}

class CriadorUsuario implements CriadorPerfil {
  @override
  Usuario criarPerfil(String nome, String email, String senha, DateTime dataDeNascimento, String genero) {
    // Crie uma implementação padrão que não faz muito sentido, mas necessária para a interface
    return Usuario(nome, email, senha, dataDeNascimento, genero, [], Configuracoes());
  }

  Usuario criarPerfilCompleto(String nome, String email, String senha, DateTime dataDeNascimento, String genero, List<Objects> interesse, Configuracoes configuracoes) {
    return Usuario(nome, email, senha, dataDeNascimento, genero, interesse, configuracoes);
  }
}

class CriadorArtista implements CriadorPerfil {
  @override
  Artista criarPerfil(String nome, String email, String senha, DateTime dataDeNascimento, String genero) {
    // Crie uma implementação padrão que não faz muito sentido, mas necessária para a interface
    return Artista(nome, email, senha, dataDeNascimento, genero, '', '', '');
  }

  Artista criarPerfilCompleto(String nome, String email, String senha, DateTime dataDeNascimento, String genero, String nomeArtista, String biografia, String paisDeOrigem) {
    return Artista(nome, email, senha, dataDeNascimento, genero, nomeArtista, biografia, paisDeOrigem);
  }
}

class Aplicacao {
  static CriadorPerfil gerarCriador(Type tipo) {
    if (tipo == Usuario) {
      return CriadorUsuario();
    } else if (tipo == Artista) {
      return CriadorArtista();
    } else {
      throw Exception('Um perfil deve ser selecionado');
    }
  }
}

void main() {
  print('Digite 1 para criar um Usuário ou 2 para criar um Artista:');
  String? escolha = stdin.readLineSync();

  if (escolha == '1') {
    // Criar um perfil de usuário
    DateTime dataDeNascimento = DateTime(1990, 1, 1);
    List<Objects> interesses = [
      Objects(nome: 'Rock', tipo: 'Gênero Musical', tags: ['Energia', 'Guitarra', 'Bateria'])
    ];
    Configuracoes configuracoes = Configuracoes();

    CriadorUsuario criadorUsuario = Aplicacao.gerarCriador(Usuario) as CriadorUsuario;
    Usuario usuario = criadorUsuario.criarPerfilCompleto(
      'John Doe',
      'johndoe@example.com',
      'password123',
      dataDeNascimento,
      'Masculino',
      interesses,
      configuracoes
    );

    print('Usuário criado: ${usuario.nome}, ${usuario.email}, ${usuario.dataFormatada}, ${usuario.genero}');
    print('Configurações do usuário: ${usuario.configuracoes}');
  } else if (escolha == '2') {
    // Criar um perfil de artista
    DateTime dataDeNascimento = DateTime(1985, 2, 15);

    CriadorArtista criadorArtista = Aplicacao.gerarCriador(Artista) as CriadorArtista;
    Artista artista = criadorArtista.criarPerfilCompleto(
      'Jane Doe',
      'janedoe@example.com',
      'password123',
      dataDeNascimento,
      'Feminino',
      'JDoe',
      'Uma biografia interessante',
      'Brasil'
    );

    print('Artista criado: ${artista.nome}, ${artista.email}, ${artista.dataFormatada}, ${artista.genero}, ${artista.nomeArtista}, ${artista.biografia}, ${artista.paisDeOrigem}');
  } else {
    print('Opção inválida!');
  }
}

```

<div style="text-align: center">
  <p>Código 1: Possível implementação em código do Factory Method em Dart (Fonte: Luis Miranda e Vinícius Mendes, 2024)</p>
</div>


## 3.1.1. Singleton

## Introdução
O Singleton é um padrão criacional que garante que uma classe tenha apenas uma instância e fornece um ponto de acesso global a essa instância. Este padrão é amplamente utilizado quando é necessário um único objeto para coordenar ações em todo o sistema, como em gerenciadores de configuração, conexões de banco de dados ou loggers.

O Singleton previne a criação de múltiplas instâncias através de um construtor privado ou protegido e controla o acesso à instância única através de um método estático público. A seguir, serão explicadas as classes participantes deste padrão, juntamente com a imagem da figura 3, que apresenta sua estrutura através de um diagrama.

- Singleton: Define o método estático que controla o acesso à instância única. Implementa um construtor privado para evitar a criação de múltiplas instâncias da classe.
- Cliente: Utiliza a instância única fornecida pelo Singleton para realizar operações necessárias.

<div style="text-align: center">
  <img src="../../Assets/EstruturaSingleton.png" alt="Estrutura do Singleton" title="Título da Imagem" />
  <p>Figura 3: Estrutura do padrão Singleton (Fonte: Refactoring Guru, 2014-2024)</p>
</div>

No diagrama, podemos ver como o Singleton mantém uma referência estática para a sua única instância e como o método estático garante a criação dessa instância apenas uma vez, fornecendo um ponto de acesso global. O Cliente interage com a instância única do Singleton para executar operações, garantindo que todos os clientes utilizem a mesma instância.

## Metodologia
A modelagem e implementação deste padrão criacional seguiu o fluxo de desenvolvimento do primeiro com os os integrantes: Limírio, Luis Miranda, Milena e Vinícius Mendes, participando ativamente através de discussões em grupo e na realização das atividades.

Para elaborar a modelagem do padrão Singleton no âmbito do nosso projeto, organizamos uma reunião em grupo para debater onde e como esse padrão poderia ser aplicado. A ata dessa reunião está disponível [aqui](https://youtu.be/okhCMuSxa2w). Durante a reunião, consultamos dois sites como referências teóricas para fundamentar nossa base.

Determinamos que o padrão Singleton seria ideal para a criação da classe `Configuracoes`. Essa classe garante que apenas uma instância de configurações seja mantida em todo o sistema, o que é crucial para assegurar a consistência das configurações do aplicativo, como modos aleatório e offline, além das frequências do equalizador.

A modelagem foi realizada pelos membros Limírio Guimarães e Milena Baruc, conforme visualizado na Figura 4.

<div style="text-align: center">
  <img src="../../Assets/ModelagemSingleton.png" alt="Modelagem do Singleton" title="Título da Imagem" />
  <p>Figura 4: Modelagem do padrão Singleton (Fonte: Limírio Guimarães e Milena Baruc, 2024)</p>
</div>

No diagrama, podemos ver que a classe `Configuracoes` possui uma referência estática para a sua única instância (`instancia: Configuracoes`) e métodos para acessar e modificar as configurações (`getInstancia()`, `ativarModoAleatorio()`, `desativarModoAleatorio()`, `ativarModoOffline()`, `desativarModoOffline()`, `ajustar(frequencia: String, valor: Int)`). Além disso, há uma associação com a classe abstrata `Perfil`, que pode ser usada para representar diferentes perfis de usuários no sistema.

Este design assegura que todas as partes do sistema utilizem a mesma instância de `Configuracoes`, promovendo a consistência e integridade das configurações em toda a aplicação.

O desenvolvimento da implementação foi realizado em paralelo com a modelagem, sendo conduzido pelos mesmos membros da equipe. Esta implementação foi feita de forma colaborativa através da plataforma Discord, utilizando como referência o site [Dart Academy](https://dart.academy/creational-design-patterns-for-dart-and-flutter-factory-method/)², que possui exemplos de implementações em diversas linguagens de programação.

Primeiro, foi criado um código para entender de maneira simplificada a lógica e a estrutura do código, que pode ser visualizado no Código 2. Em seguida, o código foi traduzido para a linguagem Dart, escolhida pela equipe para o desenvolvimento do projeto.

```dart
class Configuracoes {
  static Configuracoes? _instancia;
  bool modoAleatorio = false;
  bool modoOffline = false;
  Map<String, int> frequenciasEqualizador = {};

  Configuracoes._privateConstructor();

  static Configuracoes get instancia {
    if (_instancia == null) {
      _instancia = Configuracoes._privateConstructor();
    }
    return _instancia!;
  }

  void ativarModoAleatorio() {
    modoAleatorio = true;
  }

  void desativarModoAleatorio() {
    modoAleatorio = false;
  }

  void ativarModoOffline() {
    modoOffline = true;
  }

  void desativarModoOffline() {
    modoOffline = false;
  }

  void ajustar(String frequencia, int valor) {
    frequenciasEqualizador[frequencia] = valor;
  }
}
```
<div style="text-align: center">
  <p>Código 2: Possível implementação em código do Singleton em Dart (Fonte: Limírio Guimarães e Milena Baruc, 2024)</p>
</div>

Para testar a modelagem da classe e verificar se a implementação do padrão singleton está funcionando como esperado, podemos combinar o código 3 e o código 2 em um único arquivo, por exemplo, `main.dart`, e executá-lo utilizando `dart main.dart` no terminal. Certifique-se de ter o Dart instalado em seu sistema para realizar essa operação.

```dart
void main() {
  // Obtém a instância singleton de Configuracoes
  var config1 = Configuracoes.instancia;

  // Verifica o estado inicial dos modos
  print('Modo Aleatório: ${config1.modoAleatorio}');
  print('Modo Offline: ${config1.modoOffline}');

  // Tenta criar outra instância diretamente
  try {
    var config2 = Configuracoes._privateConstructor();
  } catch (e) {
    print('Erro ao tentar criar uma nova instância: $e');
  }

  // Verifica se config1 ainda está funcionando como esperado
  config1.ativarModoAleatorio();
  print('Modo Aleatório ativado: ${config1.modoAleatorio}');
  
  config1.desativarModoAleatorio();
  print('Modo Aleatório desativado: ${config1.modoAleatorio}');
  
  config1.ativarModoOffline();
  print('Modo Offline ativado: ${config1.modoOffline}');
  
  config1.desativarModoOffline();
  print('Modo Offline desativado: ${config1.modoOffline}');
  
  config1.ajustar('bass', 10);
  print('Frequência bass ajustada para: ${config1.frequenciasEqualizador['bass']}');
  
  config1.ajustar('treble', 5);
  print('Frequência treble ajustada para: ${config1.frequenciasEqualizador['treble']}');
  
  config1.ajustar('mid', 7);
  print('Frequências do equalizador: ${config1.frequenciasEqualizador}');
  
  // Obtém outra instância singleton de Configuracoes
  var config3 = Configuracoes.instancia;
  print('config1 e config3 são a mesma instância: ${identical(config1, config3)}');
}
```
<div style="text-align: center">
  <p>Código 3: Código para teste Singleton em Dart (Fonte: Limírio Guimarães, 2024)</p>
</div>

Para facilitar a leitura e a compreensão do documento, a Figura 5 apresenta uma captura de tela da saída resultante da combinação dos códigos 2 e 3.

<div style="text-align: center">
  <img src="../../Assets/PrintSingleton.png" alt="Modelagem do Singleton" title="Título da Imagem" />
  <p>Figura 5: Print do teste da classe Configuracoes (Fonte: Limírio Guimarães, 2024)</p>
</div>



## Referência Bibliográfica

> ¹ Factory Method, Refactoring.Guru. Disponível em: https://refactoring.guru/design-patterns/factory-method. Acesso em: 15/07/2024.

> ² Creational Design Patterns for Dart and Flutter: Factory Method, Dart Academy. Disponível em: https://dart.academy/creational-design-patterns-for-dart-and-flutter-factory-method/. Acesso em: 20/07/2024

> ³ Singleton, Refactoring.Guru. Disponível em: https://refactoring.guru/pt-br/design-patterns/singleton. Acesso em: 15/07/2024


## Bibliografia
> Creational Design Patterns, Refactoring.Guru. Disponível em: https://refactoring.guru/design-patterns/creational-patterns. Acesso em: 15/07/2024.

> Creational Design Patterns, OODesign. Disponível em: https://www.oodesign.com/creational-patterns/. Acesso em: 16/07/204.

> Padrões de Projeto: Design Patterns. Disponível em: https://biblioteca.univap.br/dados/000042/00004243.pdf. Acesso em: 23/07/2024.

## Histórico de Versões

| Versão | Data       | Descrição                                               | Autores                        | Revisores |
| ------ | ---------- | ------------------------------------------------------- | ------------------------------ | --------- |
| 1.1    | 22/07/2024 | Criação do documento e adicionando sobre Factory Method |  [Luis Miranda](https://github.com/LuisMiranda10) & [Vinícius Mendes](https://github.com/yabamiah) | [João Vítor](https://github.com/Jvsoutomaior) & [Ana Luíza](https://github.com/analuizargds)  &  [Lucas Alves Vilela](https://github.com/Lucas-AV) & [Rafael Xavier](https://github.com/rafaelxavierr) & [Israel Thalles](https://github.com/IsraelThalles) & [Luiz Pettengill](https://github.com/LuizPettengill), [Link da Revisão](https://github.com/UnBArqDsw2024-1/2024.1_G2_My_Music/pull/65)       |
| 1.2    | 22/07/2024 | Criação do documento e adicionando sobre Singleton      | [Limírio Guimarães](https://github.com/LimirioGuimaraes) & [Milena Baruc](https://github.com/MilenaBaruc) | [João Vítor](https://github.com/Jvsoutomaior) & [Ana Luíza](https://github.com/analuizargds)  &  [Lucas Alves Vilela](https://github.com/Lucas-AV) & [Rafael Xavier](https://github.com/rafaelxavierr) & [Israel Thalles](https://github.com/IsraelThalles) & [Luiz Pettengill](https://github.com/LuizPettengill), [Link da Revisão](https://github.com/UnBArqDsw2024-1/2024.1_G2_My_Music/pull/65)             |
| 1.3    | 22/07/2024 | Adicionada possível implementação Singleton      | [Limírio Guimarães](https://github.com/LimirioGuimaraes) & [Milena Baruc](https://github.com/MilenaBaruc) |  [João Vítor](https://github.com/Jvsoutomaior) & [Ana Luíza](https://github.com/analuizargds)  &  [Lucas Alves Vilela](https://github.com/Lucas-AV) & [Rafael Xavier](https://github.com/rafaelxavierr) & [Israel Thalles](https://github.com/IsraelThalles) & [Luiz Pettengill](https://github.com/LuizPettengill), [Link da Revisão](https://github.com/UnBArqDsw2024-1/2024.1_G2_My_Music/pull/65)             |
| 1.4    | 25/07/2024 | Correção de imagens quebradas      | [Ana Luíza](https://github.com/analuizargds)  | [Limírio Guimarães](https://github.com/LimirioGuimaraes)              |
| 1.5    | 25/07/2024 | Correção de imagens quebradas      | [Limírio Guimarães](https://github.com/LimirioGuimaraes) |               |
| 1.6    | 25/07/2024 | Adicionado testes do modelo      | [Limírio Guimarães](https://github.com/LimirioGuimaraes) |               |
