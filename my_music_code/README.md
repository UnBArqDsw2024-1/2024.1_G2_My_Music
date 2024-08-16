# Guia de instalação para rodar o projeto 

 

## Linux (Debian/Ubuntu) 

 

### Primeiro: baixar o Android Studio 

[Guia de instalação](https://developer.android.com/studio/install?hl=pt-br) 

[Android Studio download](https://developer.android.com/studio?hl=pt-br) 

 

“ 

Para instalar o Android Studio no Linux, siga estas etapas: 

    Descompacte o arquivo .tar.gz transferido por download em um local adequado para seus aplicativos, como /usr/local/ para seu perfil de usuário ou /opt/ para usuários compartilhados.  

Em uma versão de 64 bits do Linux, primeiro instale as bibliotecas necessárias para máquinas de 64 bits.  

    Para iniciar o Android Studio, abra um terminal, navegue até o diretório android-studio/bin/ e execute studio.sh. 

    Selecione se você quer ou não importar as configurações anteriores do Android Studio e clique em OK. 

    Conclua as etapas do assistente de configuração do Android Studio, que inclui o download dos componentes do SDK do Android necessários para o desenvolvimento. 

 

Bibliotecas necessárias para máquinas de 64 bits  

Se você estiver executando uma versão do Ubuntu de 64 bits, será necessário instalar algumas bibliotecas de 32 bits com o seguinte comando: 

``` 

sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 

``` 
 

” 

### Segundo: baixar o Flutter 

[Guia de instalação](https://docs.flutter.dev/get-started/install/linux/android) 

 

### Terceiro: baixar o vs code 

[Guia de instalação](https://code.visualstudio.com/docs/setup/linux) 

[Download](https://code.visualstudio.com/download) 

 

### Baixar a extensão do Flutter no vs code

![](./assets/vs_code_extension.png)

### Clonar o repositorio

![](./assets/clone_rep.png)

### Abrir o repositorio no vs code

ir pro my_music_code
```
cd my_music_code
```

Seleciona um emulador de celular

![](./assets/image1.png)

![](./assets/image2.png)


Depois roda o projeto
```
Flutter run
```

## Windows

### Primeiro: baixar o Android Studio 

[Guia de instalação](https://developer.android.com/studio/install?hl=pt-br) 

[Android Studio download](https://developer.android.com/studio?hl=pt-br) 

“ 

Para instalar o Android Studio no Windows, siga estas etapas: 

    Execute o arquivo .exe baixado no site do android studio.  

### Segundo: baixar o Flutter 

[Guia de instalação]([https://docs.flutter.dev/get-started/install/linux/android](https://docs.flutter.dev/get-started/install/windows/mobile)

### Terceiro: baixar o vs code 

[Guia de instalação](https://code.visualstudio.com/docs/setup/linux) 

[Download](https://code.visualstudio.com/download) 

### Baixar a extensão do Flutter no vs code

![](./assets/vs_code_extension.png)


### Clonar o repositorio

![](./assets/clone_rep.png)

Seleciona um emulador de celular

![](./assets/image1.png)

![](./assets/image2.png)


Depois roda o projeto
```
Flutter run
```
