## 3.2.1 GoFs Criacionais
O padrão GoF criacional tem como objetivo simplificar a criação de objetos, fornecendo mecanismos que tornam um sistema independente e flexível em relação a como seus objetos são criados, suas estruturas internas e suas representações. O GoF criacional inclui cinco padrões: Singleton, Factory Method, Abstract Factory, Builder, Prototype e Object Pool.

No contexto do nosso projeto, focaremos nos padrões Factory Method e Singleton.

### 3.2.1.1. Factory Method
#### Introdução
O Factory Method é um padrão criacional que cria um padrão de instanciar uma superclasse, porém, dá a responsabilidade de definir o seu tipo para as subclasses. É um padrão muito utilizado em bibliotecas, como de inteface gráfica onde geralmente existe uma padrão para criar uma superclasse, mas, só no contexto da aplicação (no caso pode ser onde essa interface irá ser executada) que será definido o tipo pela suas subsclasses.
As classes participantes deste padrão serão explicado logo abaixo, juntamente com a imagem da figura 1, que apresenta sua estrutura através de um diagrama.

- Product(Produto abstrato) - Define uma interface para objetos criados pelo método de fábrica
- ConcetreProduct (Produto concreto) - Implementa a interface do produto
- Creator(Criador abstrato) - Possui o método FactoryMethod, que retorna um objeto Product. Pode chamar o método gerador para criar objetos Produto.
- ConcretCreater(Criador concreto) - Substituí o método de geração para criar objetos da classe ConcreProduct

<div style="text-align: center">
  <img src="../Assets/EstruturaFactoryMethod.png" alt="Estrutura do Factory Method" title="Título da Imagem" />
  <p>Figura 1: Estrutura do padrão Factory Method (Fonte: Refactoring Guru, 2014-2024)¹</p>
</div>

#### Metodologia

Antes de descrever como foi realizada a modelagem e a implementação dos padrões criacionais utilizados, é importante ressaltar como a equipe foi organizada para a realização deste artefato. Foi criado um subgrupo composto por quatro pessoas: Limírio, Luiz Eduardo, Milena e Vinícius. Todos participaram ativamente através de discussões em grupo e na realização das atividades.

Para o desenvolvimento da modelagem do Factory Method no contexto do nosso projeto, realizamos uma reunião em grupo para discutir onde e como o padrão poderia ser aplicado. A ata dessa reunião pode ser acessada aqui. Durante essa reunião, utilizamos dois sites como referências teóricas para termos um embasamento adequado.

Decidimos que poderíamos utilizar o padrão Factory Method na criação da classe abstrata `Perfil`. Essa superclasse possui duas subclasses, `Usuário` e `Artista`, cujas instâncias mudam conforme o contexto, permitindo funcionalidades diferentes no aplicativo para cada tipo de perfil. A modelagem foi realizada pelos membros Luis Miranda e Vinicius Mendes, conforme visualizado na Imagem 1.

![[Modelagem Factory Method.png]]

<div style="text-align: center">
  <img src="../Assets/ModelagemFactoryMethod.png" alt="Modelagem do padrão Factory Method" title="Título da Imagem" />
  <p>Figura 2: Modelagem do padrão Factory Method (Fonte: Luis Miranda e Vinícius Mendes, 2024)</p>
</div>

O desenvolvimento da implementação foi realizado em paralelo com a modelagem, sendo conduzido pelos mesmos membros da equipe. Esta implementação foi feita de forma colaborativa através da plataforma Discord, utilizando como referência o site [Dart Academy](https://dart.academy/creational-design-patterns-for-dart-and-flutter-factory-method/)², que possui exemplos de implementações em diversas linguagens de programação.

Primeiro, foi criado um pseudocódigo para entender de maneira simplificada a lógica e a estrutura do código, que pode ser visualizado no Código 1. Em seguida, o pseudocódigo foi traduzido para a linguagem Dart, escolhida pela equipe para o desenvolvimento do projeto.

### 3.2.1.2. Singleton
#### Introdução

#### Metodologia

## Referência Bibliográfica
> ¹ Factory Method, Refactoring.Guru. Disponível em: https://refactoring.guru/design-patterns/factory-method. Acesso em: 15/07/2024.

> ² Creational Design Patterns for Dart and Flutter: Factory Method, Dart Academy. Disponível em: https://dart.academy/creational-design-patterns-for-dart-and-flutter-factory-method/. Acesso em: 20/07/2024

## Bibliografia
> Creational Design Patterns, Refactoring.Guru. Disponível em: https://refactoring.guru/design-patterns/creational-patterns. Acesso em: 15/07/2024.

> Creational Design Patterns, OODesign. Disponível em: https://www.oodesign.com/creational-patterns/. Acesso em: 16/07/204.

## Histórico de Versões

| Versão | Data       | Descrição                                               | Autores                        | Revisores |
| ------ | ---------- | ------------------------------------------------------- | ------------------------------ | --------- |
| 0.1    | 22/07/2024 | Criação do documento e adicionando sobre Factory Method | Luis Miranda e Vinícius Mendes |           |
