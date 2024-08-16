import 'package:audioplayers/audioplayers.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import "package:my_music_code/universal.dart" as universal;

setupMusic() async {
  final yt = YoutubeExplode();
  final result = (await yt.search("${universal.currentMusic.name!} ${universal.currentMusic.artist!}")).first;
  final videoId = result.id.value;

  final manifest = await yt.videos.streamsClient.getManifest(videoId);
  final audioUrl = manifest.audioOnly.first;
  universal.audioPlayer.play(UrlSource(audioUrl.url.toString()));
}
