import 'dart:convert';
import 'dart:io';
import 'package:igals_expotify/objects/spot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify/spotify.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SpotifyStorageUtil {
  static String? _pathVar = null;

  static Future<String> get _path async {
    _pathVar ??=
        "${(await getApplicationDocumentsDirectory()).path}/spotgrat.json";
    return _pathVar!;
  }

  static Future saveToken(SpotifyApiCredentials creds) async {
    try {
      Map json = Map();
      json["clientId"] = creds.clientId;
      json["clientSecret"] = creds.clientSecret;
      json["accessToken"] = creds.accessToken;
      json["refreshToken"] = creds.refreshToken;
      json["scopes"] = creds.scopes;
      json["expiration"] = creds.expiration?.toIso8601String();
      File file = File(await _path);
      file.writeAsString(jsonEncode(json));
    } catch (e) {
      //I dont care
    }
  }

  static Future<SpotifyApi?> getGrant() async {
    SpotifyApi? spotify;
    try {
      File file = File(await _path);
      Map json = jsonDecode(await file.readAsString());
      if (json.containsKey("clientId") &&
          json.containsKey("clientSecret") &&
          json.containsKey("refreshToken") &&
          json.containsKey("scopes") &&
          json.containsKey("expiration")) {
        spotify = SpotifyApiSingelton.restoreSpotifyApi(
            SpotifyApiCredentials(json["clientId"], json["clientSecret"],
                accessToken: json["accessToken"],
                refreshToken: json["refreshToken"],
                scopes: (json["scopes"] as List)
                    .map((item) => item as String)
                    .toList(),
                expiration: DateTime.parse(json["expiration"])),
            saveToken);
      }
    } catch (e) {
      //I dont care
    }
    return spotify;
  }

  static Future loadToken(dynamic grant, NavigationRequest navReq) async {
    final spotify =
        SpotifyApiSingelton.getSpotInstance(grant: grant, url: navReq.url);
    var creds = await spotify.getCredentials();
    saveToken(creds);
  }
}
