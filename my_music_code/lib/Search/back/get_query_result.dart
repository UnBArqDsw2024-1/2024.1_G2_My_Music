import 'package:my_music_code/Models/music_model.dart';
import 'package:my_music_code/universal.dart' as universal;
import 'package:spotify/spotify.dart';

getQuery(String query) async {
  var results = await universal.spotifyApi.search.get(query).first(30);
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
  return listResults;
}
