import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/spaced_column.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/legal/text_section.dart';

Map<String, Map<String,String>> aboutMapText = {
  "MyMusic":{
    "title":"MyMusic",
    "description":'My Music é um software de código aberto, desenvolvido para o gerenciamento e reprodução de músicas, inspirado em plataformas robustas como o Spotify. Este projeto foi criado como parte do programa acadêmico da disciplina de Arquitetura e Desenho de Software, no semestre 2024/1, na Universidade de Brasília, Faculdade do Gama, sob a orientação da discente Milene Serrano. O My Music tem como objetivo proporcionar uma experiência prática e interativa, permitindo que os usuários organizem suas playlists, explorem novas músicas e gerenciem seus conteúdos musicais de forma eficiente e personalizada.',
  },
  "Objetivo":{
    "title":"Objetivo",
    "description":'O objetivo principal do My Music é proporcionar aos usuários uma ferramenta eficiente e fácil de usar para o gerenciamento de suas músicas. Seja para uso pessoal ou educativo, o projeto está disponível gratuitamente, incentivando a colaboração e o desenvolvimento contínuo da comunidade.',
  },
  'Licenciamento':{
    "title":"Licenciamento",
    'description':'O código-fonte do My Music está disponível sob a licença MIT, permitindo que qualquer pessoa possa utilizar, modificar e distribuir o software, respeitando os termos da licença. Acreditamos que o compartilhamento de conhecimento e a contribuição coletiva são fundamentais para a evolução da tecnologia.',
  },
  'Contribuições':{
    "title":"Contribuições",
    'description':'Contribuições ao My Music são bem-vindas e incentivadas. Se você deseja participar, fique à vontade para fazer fork do repositório, submeter pull requests, ou sugerir melhorias. Cada contribuição ajuda a fortalecer e aprimorar o projeto.',
  },
  'Responsabilidade e Uso':{
    "title":"Responsabilidade e Uso",
    'description':'O My Music é fornecido "como está", sem garantias de qualquer tipo. Embora façamos o possível para garantir que o software seja funcional e seguro, o uso é por sua conta e risco. Recomendamos que os usuários sigam as melhores práticas ao utilizar e modificar o software.',
  },
  'Desenvolvimento Contínuo':{
    'title':'Desenvolvimento Contínuo',
    'description':'Este projeto está em constante evolução, com atualizações e melhorias sendo feitas regularmente. Acompanhe o repositório oficial no GitHub para ficar por dentro das últimas novidades e colabore conosco para fazer do My Music uma ferramenta cada vez melhor.',
  }
};

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Sobre MyMusic',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: SpacedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: List.from(
                aboutMapText.entries.map(
                  (entry) => TextSection(
                    title: entry.value['title']!,
                    description: entry.value['description']!,
                  )
                )
              )
            ),
          ),
        ),
      ),
    );
  }
}
