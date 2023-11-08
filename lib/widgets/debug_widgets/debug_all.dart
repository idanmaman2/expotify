import 'package:flutter/material.dart';
import 'package:igals_expotify/objects/spot.dart';
import 'package:igals_expotify/widgets/debug_widgets/section.dart';

class DebugAll extends StatelessWidget {
  final Iterable my_eposides,
      my_albums,
      popular_songs,
      top_artists,
      my_shows,
      my_playlists,
      top_tracks,
      top_playlist_in_country;

  const DebugAll(
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
                    child: DebugSection(title : "my_albums" ,lst : my_albums.map((x)=>x.name ?? "IDK"))
                  ),
                  Expanded(
                    child: DebugSection(title : "top_artists" ,lst : top_artists.map((x)=>x.name ?? "IDK")) 
                  ),
                  Expanded(
                    child:DebugSection(title : "my_eposides" ,lst : my_eposides.map((x)=>x.name ?? "IDK"))
                  ),
                  Expanded(
                    child: DebugSection(title : "my_shows" ,lst : my_shows.map((x)=>x.name ?? "IDK"))
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DebugSection(title : "my_playlists" , lst : my_playlists.map((x)=>x.name ?? "IDK")) 
           
                  ),
                  Expanded(
                    child: DebugSection(title : "top_tracks" ,lst : top_tracks.map((x)=>x.name ?? "IDK"))
                  ),
                  Expanded(
                    child: DebugSection(title : "top_playlist_in_country" ,lst : top_playlist_in_country.map((x)=>x.name ?? "IDK"))
                  ),
                  Expanded(
                    child: DebugSection(title : "top_artists" ,lst : top_artists.map((x)=>x.name ?? "IDK"))
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
