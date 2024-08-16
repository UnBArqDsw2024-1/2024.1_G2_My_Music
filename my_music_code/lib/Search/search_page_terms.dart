// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_music_code/Feed/Components/feed_music_grid.dart';
import 'package:my_music_code/Music/music_page.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:spotify/spotify.dart' hide Image;
import 'package:my_music_code/universal.dart' as universal;

class SearchPageTerms extends StatefulWidget {
  const SearchPageTerms({super.key});

  @override
  State<SearchPageTerms> createState() => _SearchPageTermsState();
}

class _SearchPageTermsState extends State<SearchPageTerms> {
  TextEditingController textEditingController = TextEditingController();
  List<Widget> buildTile = [];
  String query = "";

  getQuery(SpotifyApi spotify, String query) async {
    var results = await spotify.search.get(query).first(30);
    List<Music> listResults = [];
    for (var pages in results) {
      if (pages.items != null) {
        for (var res in pages.items!) {
          if (res is Track) {
            listResults.add(
              Music(
                name: res.name!,
                id: res.id!,
                artist: res.artists!.first.name!,
                imageUrl: res.album!.images!.first.url!,
                link: res.externalUrls!.spotify!,
                duration: res.durationMs!,
              ),
            );
          }
        }
      }
    }

    setState(() {
      buildTile = List.from(listResults.map((music) => ListTile(
          onTap: () {
            showModalBottomSheet(
              useRootNavigator: false,
              isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (context) {
                return MusicPage(music: music);
              });
          },
          title: Text(music.name!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
          subtitle: Text(music.artist!, style: TextStyle(color: Colors.white)),
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: secondaryColor,
              image: DecorationImage(
                image: NetworkImage(music.imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ))));
    });
  }

  @override
  void initState() {
    getQuery(universal.spotifyApi, "music");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: textEditingController,
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              onSubmitted: (value) {
                getQuery(universal.spotifyApi, query);
              },
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Música...',
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black), // Ícone no final do campo
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: buildTile,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
