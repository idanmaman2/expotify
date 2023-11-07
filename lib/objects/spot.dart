import 'package:spotify/spotify.dart';

// IDK singelton or something - why do u read that ??
class SpotifyApiSingelton {
  static SpotifyApi? _spotInstance;

  static SpotifyApi getSpotInstance({dynamic grant, String url = ""}) {
    _spotInstance ??= SpotifyApi.fromAuthCodeGrant(grant, url);
    return _spotInstance!;
  }

  static SpotifyApi restoreSpotifyApi(SpotifyApiCredentials creds,
      dynamic Function(SpotifyApiCredentials) refresh) {
    _spotInstance = SpotifyApi(creds, onCredentialsRefreshed: refresh);
    return _spotInstance!;
  }
}
