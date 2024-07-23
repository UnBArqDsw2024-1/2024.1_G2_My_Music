## 3.3.1 GoFs Estrutural

Os padrões GoF estruturais tratam da composição de classes e objetos para formar estruturas maiores e mais complexas. Eles ajudam a garantir que, ao combinar diferentes classes e objetos, o resultado final seja flexível e eficiente, além de ser fácil de manter e entender. Os padrões estruturais focam na maneira como as classes e os objetos são compostos para obter novas funcionalidades e facilitar a gestão do código.

No contexto do nosso projeto, focaremos no padrão Facade.

## 3.3.1.1 Facade

### Introdução
O padrão Facade é um padrão estrutural que oferece uma interface unificada para um conjunto de interfaces em um subsistema. Facade define uma interface de nível mais alto que torna o subsistema mais fácil de usar. O padrão é particularmente útil para sistemas complexos que têm muitas partes interagindo entre si.
As classes deste padrão serão explicado logo abaixo, juntamente com a imagem da figura 1, que apresenta sua estrutura através de um diagrama.

-   **Facade**: Fornece um acesso conveniente para uma parte particular da funcionalidade do subsistema. Ela sabe onde direcionar o pedido do cliente e como operar todas as partes móveis.
-   **Facade Adicional**: Pode ser criada para prevenir a poluição de uma única fachada com funcionalidades não relevantes que podem torná-lo mais uma estrutura complexa. Fachadas adicionais podem ser usadas tanto por clientes como por outras fachadas.
-   **Subsistema Complexo**: Consiste em dúzias de objetos variados que fazem parte dos detalhes de implementação do subsistema, tais como objetos de inicialização na ordem correta e suprí-los com dados no formato correto.

<div style="text-align: center">
  <img src="../Assets/PadroesDeProjeto-Estrutural-TemplateFacade.png" alt="Template estrutura do Facade" title="Estrutura padrão do Facade" />
  <p>Figura 1: Estrutura do padrão Facade (Fonte: Refactoring Guru, 2014-2024)²</p>
</div>

### Metodologia

## Referência Bibliográfica
> ¹ Facade, Refactoring.Guru. Disponível em: https://refactoring.guru/design-patterns/facade. Acesso em: 21/07/2024.

> ² Structural Design Patterns for Dart and Flutter: Façade, Dart Academy. Disponível em: https://dart.academy/structural-design-patterns-for-dart-and-flutter-facade/. Acesso em: 21/07/2024


## Bibliografia
> Structural Design Patterns, Refactoring.Guru. Disponível em: https://refactoring.guru/design-patterns/structural-patterns. Acesso em: 20/07/2024.

## Histórico de Versões

| Versão | Data       | Descrição                                               | Autores                        | Revisores |
| ------ | ---------- | ------------------------------------------------------- | ------------------------------ | --------- |
| 0.1    | 23/07/2024 | Criação do documento e adição do template |  [Lucas Alves Vilela](https://github.com/Lucas-AV), [Henrique Hida](https://github.com/HenriqueHida), [Luiz Guilherme](https://github.com/luizpettengill) e [Israel Thalles](https://github.com/IsraelThalles) | -------- |
| 0.2 | 23/07/2024 | Adição do GOF Estrutural Facade aos Assets & Referências Bibliográficas |  [Lucas Alves Vilela](https://github.com/Lucas-AV), [Henrique Hida](https://github.com/HenriqueHida), [Luiz Guilherme](https://github.com/luizpettengill) e [Israel Thalles](https://github.com/IsraelThalles) | -------- |
| 0.3 | 23/07/2024 | Adição da Introdução e template de GOF Estrutural Facade | [Lucas Alves Vilela](https://github.com/Lucas-AV), [Henrique Hida](https://github.com/HenriqueHida), [Luiz Guilherme](https://github.com/luizpettengill) e [Israel Thalles](https://github.com/IsraelThalles)  | -------- |
| -------- | -------- | -------- |  -------- | -------- |
| -------- | -------- | -------- |  -------- | -------- |