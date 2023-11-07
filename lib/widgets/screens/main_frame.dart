import 'package:flutter/material.dart';
import 'package:igals_expotify/objects/spot.dart';

class MainFrame extends StatelessWidget {
  final Iterable my_eposides,
      my_albums,
      popular_songs,
      top_artists,
      my_shows,
      my_playlists,
      top_tracks,
      top_playlist_in_country;

  const MainFrame(
      {required this.top_playlist_in_country,
      required this.top_tracks,
      required this.my_playlists,
      required this.my_shows,
      required this.top_artists,
      required this.my_albums,
      required this.popular_songs,
      required this.my_eposides,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "IDK WE WILL SEE ${SpotifyApiSingelton.getSpotInstance().me.toString()}"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: List.generate(
                            my_albums.length,
                            (index) => Text(
                                my_albums.skip(index).first.name ?? "IDK")),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: List.generate(popular_songs.length,
                            (index) => Text(popular_songs.skip(index).first)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: List.generate(
                            my_eposides.length,
                            (index) => Text(
                                my_eposides.skip(index).first.name ?? "IDK")),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: List.generate(
                            my_shows.length,
                            (index) =>
                                Text(my_shows.skip(index).first.name ?? "IDK")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: List.generate(
                            my_playlists.length,
                            (index) => Text(
                                my_playlists.skip(index).first.name ?? "IDK")),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: List.generate(
                            top_tracks.length,
                            (index) => Text(
                                top_tracks.skip(index).first.name ?? "IDK")),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: List.generate(
                            top_playlist_in_country.length,
                            (index) => Text(top_playlist_in_country
                                    .skip(index)
                                    .first
                                    .name ??
                                "IDK")),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: List.generate(
                            top_artists.length,
                            (index) => Text(
                                top_artists.skip(index).first.name ?? "IDK")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
