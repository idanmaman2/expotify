import 'package:spotify/spotify.dart';
import 'package:igals_expotify/objects/spot.dart';
// one simple track object that unit every option that spotify provide ... IDK 

class TrackSpot {
  late String? name;
  late String? id;
  late String? uri;
  late String? originalPlayList;
  late Iterable<String> singersFullName;
  String? filePath;
  TrackSpot(this.name, this.id, this.uri, this.singersFullName);

  Future<TrackSpot> fromSpotifyId(String id) async {
    Track track = await SpotifyApiSingelton.getSpotInstance().tracks.get(id);
    return TrackSpot(
        track.name, id, track.uri, track.artists!.map((x) => x.name!));
  }

  TrackSpot.fromTrack(Track x)
      : name = x.name,
        id = x.id,
        uri = x.uri,
        singersFullName = x.artists!.map((x) => x.name!);

  TrackSpot.fromTrackSimple(TrackSimple x)
      : name = x.name,
        id = x.id,
        uri = x.uri,
        singersFullName = x.artists!.map((x) => x.name!);

  static Future<TrackSpot> fromTrackLinkNameInit(
      TrackLink x, SpotifyApi y) async {
    Track track = await y.tracks.get(x.id as String);
    return TrackSpot(
        x.id, x.uri, track.name, track.artists!.map((x) => x.name!));
  }
}
