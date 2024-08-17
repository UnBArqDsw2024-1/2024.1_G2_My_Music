# My_Music

<div align="center">

![logo](LogoMyMusic.png)

</div>

**Código da Disciplina**: FGA0208<br>
**Número do Grupo**: 02<br>

## 💡 Introdução

O objetivo deste repositório é fornecer uma plataforma centralizada para o armazenamento e organização de todos os artefatos e resultados relacionados ao projeto de desenvolvimento da aplicação de reprodução de música do Grupo 2 de Arquitetura e Desenho de Software da Universidade de Brasília (UnB-FGA) no semestre 2024.1. Ele serve como um espaço colaborativo onde os membros do grupo podem compartilhar e acompanhar o progresso do trabalho, documentar decisões tomadas, armazenar código-fonte, artefatos de design, relatórios de progresso, entre outros materiais relevantes.

## 👥 Alunos

| Matrícula   | Nome                                       |                                                                                          |
|-------------|--------------------------------------------|------------------------------------------------------------------------------------------|
| 211030676   | [Ana Luíza Rodrigues da Silva](https://github.com/analuizargds) | <img src="https://github.com/analuizargds.png" width="120px">                           |
| 190042303   | [Carlos Daniel de Godoy Barros Nascimento](https://github.com/CDGodoy) | <img src="https://github.com/CDGodoy.png" width="120px">                               |
| 190085584   | [Carlos Eduardo Mendes de Mesquita](https://github.com/CarlosEduardoMendesdeMesquita) | <img src="https://github.com/CarlosEduardoMendesdeMesquita.png" width="120px">           |
| 180113569   | [Henrique Sandoval Camargo Hida](https://github.com/HenriqueHida) | <img src="https://github.com/HenriqueHida.png" width="120px">                             |
| 190014776   | [Israel Thalles Dutra dos Santos](https://github.com/IsraelThalles) | <img src="https://github.com/IsraelThalles.png" width="120px">                           |
| 200020927   | [João Vítor Motta Souto Maior](https://github.com/Jvsoutomaior) | <img src="https://github.com/Jvsoutomaior.png" width="120px">                             |
| 200040201   | [Limíro Correia Guimarães](https://github.com/LimirioGuimaraes) | <img src="https://github.com/LimirioGuimaraes.png" width="120px">                         |
| 211062141   | [Lucas Alves Vilela](https://github.com/Lucas-AV) | <img src="https://github.com/Lucas-AV.png" width="120px">                                 |
| 211063200   | [Luís Eduardo Carneiro Miranda](https://github.com/LuisMiranda10) | <img src="https://github.com/LuisMiranda10.png" width="120px">                           |
| 150138202   | [Luiz Guilherme Palhares Pettengill](https://github.com/luizpettengill) | <img src="https://github.com/luizpettengill.png" width="120px">                         |
| 211062339   | [Milena Baruc Rodrigues Morais](https://github.com/MilenaBaruc) | <img src="https://github.com/MilenaBaruc.png" width="120px">                             |
| 200026551   | [Rafael Xavier Canabrava](https://github.com/rafaelxavierr) | <img src="https://github.com/rafaelxavierr.png" width="120px">                           |
| 211063265   | [Vinícius Mendes Martins](https://github.com/yabamiah) | <img src="https://github.com/yabamiah.png" width="120px">                                 |

## Sobre

O aplicativo MyMusic, é um aplicativo para que seja possível ouvir músicas e fazer playlist de acordo com seu gosto pessoal.

## 👨‍💻 Guia de Instalação

### 🌐 QRcode via site do MyMusic!

Nosso site oferece uma maneira simples e rápida de baixar nosso aplicativo diretamente para o seu dispositivo móvel. Ao acessar o site, você encontrará um QR code centralizado, que pode ser escaneado com a câmera do seu smartphone. Isso permitirá que você baixe nosso aplicativo e comece a curtir suas músicas favoritas imediatamente.

Este site foi cuidadosamente hospedado na AWS (Amazon Web Services), uma das plataformas de nuvem mais confiáveis e escaláveis disponíveis no mercado. Utilizando a AWS, garantimos:

- **Alta disponibilidade:** Seu acesso ao site é contínuo, mesmo durante períodos de alta demanda.
- **Segurança robusta:** Seus dados e informações são protegidos por medidas de segurança de ponta.
- **Escalabilidade:** Conforme nossa base de usuários cresce, nossa infraestrutura se adapta automaticamente para manter a performance ideal.

Além disso, a infraestrutura do site foi provisionada e configurada usando **Terraform**, uma ferramenta poderosa de infraestrutura como código (IaC). O uso do Terraform nos permitiu:

- **Automatização:** Implementar e gerenciar a infraestrutura de forma automatizada, reduzindo erros manuais.
- **Controle de Versão da Infraestrutura:** Como toda a configuração da infraestrutura está codificada, é possível versionar e auditar as mudanças feitas. Isso traz mais segurança e permite reverter a configuração para um estado anterior, caso seja necessário.
- **Facilidade de manutenção:** Com Terraform, ajustes e melhorias na infraestrutura podem ser feitos de forma simples e eficiente.

### 📱 Como usar o site

1. Acesse o nosso site clicando [AQUI](http://mybuck-terraform-s3.s3-website-sa-east-1.amazonaws.com/) e localize o QR code no centro da página.
2. Abra a câmera do seu smartphone e aponte-a para o QR code.
3. Instale o aplicativo e aproveite a melhor experiência musical diretamente no seu dispositivo.

### 🚀 Linux (Debian/Ubuntu)

#### 1) Baixar o Android Studio

[Guia de instalação](https://developer.android.com/studio/install?hl=pt-br)

[Android Studio download](https://developer.android.com/studio?hl=pt-br)

Para instalar o Android Studio no Linux, siga estas etapas:

    Descompacte o arquivo .tar.gz transferido por download em um local adequado para seus aplicativos, como /usr/local/ para seu perfil de usuário ou /opt/ para usuários compartilhados.  

Em uma versão de 64 bits do Linux, primeiro instale as bibliotecas necessárias para máquinas de 64 bits.  

    Para iniciar o Android Studio, abra um terminal, navegue até o diretório android-studio/bin/ e execute studio.sh. 

    Selecione se você quer ou não importar as configurações anteriores do Android Studio e clique em OK. 

    Conclua as etapas do assistente de configuração do Android Studio, que inclui o download dos componentes do SDK do Android necessários para o desenvolvimento. 

Bibliotecas necessárias para máquinas de 64 bits  

Se você estiver executando uma versão do Ubuntu de 64 bits, será necessário instalar algumas bibliotecas de 32 bits com o seguinte comando:

```bash
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 
```

#### 2) Baixar o Flutter

[Guia de instalação](https://docs.flutter.dev/get-started/install/linux/android)

#### 3) Baixar o VS Code

[Guia de instalação](https://code.visualstudio.com/docs/setup/linux)

[Download](https://code.visualstudio.com/download)

#### 4) Baixar a extensão do Flutter no vs code

[Extensão](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)

#### 5) Clonar o repositorio

#### 6) Abrir o repositorio no vs code

Vá para o diretório do projeto

```bash
cd my_music_code
```

Selecione um emulador de celular

#### 🎼 Rode o projeto e curta uma música 💃

```bash
flutter run
```

### 🚀 Windows

#### 1) Baixar o Android Studio 

[Guia de instalação](https://developer.android.com/studio/install?hl=pt-br)

[Android Studio download](https://developer.android.com/studio?hl=pt-br)

Para instalar o Android Studio no Windows, siga estas etapas:

    Execute o arquivo .exe baixado no site do android studio.  

#### 2) Baixar o Flutter 

[Guia de instalação](https://docs.flutter.dev/get-started/install/windows/mobile)

#### 3) Baixar o VS Code 

[Guia de instalação](https://code.visualstudio.com/docs/setup/linux)

[Download](https://code.visualstudio.com/download)

#### 4) Baixar a extensão do Flutter no vs code

[Extensão](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)

#### 5) Clonar o repositorio

Seleciona um emulador de celular

#### 🎼 Rode o projeto e curta uma música 💃

```bash
flutter run
```

## Histórico de Versão
| Versão | Data      | Descrição | Autores | Revisor |
| :-:    | :-----:   | :------   | ----  | ------- |
| 1.0    |16/08/2024 | Criação do Documento | [Luis Miranda](https://github.com/LuisMiranda10) & [Milena Baruc](https://github.com/MilenaBaruc)| [Lucas Alves Vilela](https://github.com/Lucas-AV), [Link da revisão](https://github.com/UnBArqDsw2024-1/2024.1_G2_My_Music/pull/120)  |
