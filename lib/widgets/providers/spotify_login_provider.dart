import 'package:flutter/material.dart';
import 'package:igals_expotify/widgets/screens/main_frame.dart';
import 'package:spotify/spotify.dart';
import 'package:igals_expotify/objects/spot.dart';

class SpotifyLoginProvider extends ChangeNotifier {
  Future nextScreen(context) async {
    Future.delayed(const Duration(milliseconds: 10)).then((_) async {
      SpotifyApi spotify = SpotifyApiSingelton.getSpotInstance();
      var me = await spotify.me.get();
      String displayName = me.displayName ?? "IDK";
      //var top_songs_in_country =
      //  await spotify.categories.newReleases(country: me.country).all();
     final popular_songs = (await spotify.me.recentlyPlayed(limit: 50).all())
          .map((e) => e.track?.name ?? "IDK");
      final my_albums = await (spotify.me.savedAlbums()).all();
      final my_eposides = await (spotify.me.savedEpisodes()).all();
      final my_shows = await (spotify.me.savedShows()).all();
      final my_playlists = await (spotify.playlists.me.all());
      final top_playlist_in_country = await spotify.playlists.featured.all();
      final top_artists = await spotify.me.topArtists().all();
      final top_tracks = await spotify.me.topTracks().all();

      print("still wainting bro...");
      print(displayName);
      Navigator.pop(context); //no back to that page
      Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => MainFrame(
                  top_playlist_in_country: top_playlist_in_country,
                  top_tracks: top_tracks,
                  my_playlists: my_playlists,
                  my_shows: my_shows,
                  top_artists: top_artists,
                  my_albums: my_albums,
                  popular_songs: popular_songs,
                  my_eposides: my_eposides)));
    });
  }
}
