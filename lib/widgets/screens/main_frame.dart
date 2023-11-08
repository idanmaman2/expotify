import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:igals_expotify/objects/spot.dart';
import 'package:igals_expotify/widgets/cards/preview.dart';
import 'package:igals_expotify/widgets/parts/preview_section.dart';
import 'package:spotify/spotify.dart';

class MainFrame extends StatelessWidget {
  const MainFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text("Expotify",
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 30,
                      fontFeatures: [FontFeature.enable('smcp')]))),
        ),
        body: ListView(
          children: [
            PreviewSection(
              nextScreen: const Text("IDK"),
              title: "My PlayLists",
              previewElments: (() async {
                var x = await SpotifyApiSingelton.getSpotInstance()
                    .playlists
                    .me
                    .all();
                return x.map((e) => PreviewCard(
                    defaultImage: "assets/images/no_playlist.jpg",
                    imageUrl: e.images?.firstOrNull?.url,
                    further: const Text("IDK"),
                    title: e.name ?? "IDK"));
              })(),
            ),
            PreviewSection(
              nextScreen: const Text("IDK"),
              title: "My Albums",
              previewElments: (() async {
                var x = await SpotifyApiSingelton.getSpotInstance()
                    .me
                    .savedAlbums()
                    .all();
                return x.map((e) => PreviewCard(
                    defaultImage: "assets/images/no_playlist.jpg",
                    imageUrl: e.images?.firstOrNull?.url,
                    further: const Text("IDK"),
                    title: e.name ?? "IDK"));
              })(),
            ),
            PreviewSection(
              nextScreen: const Text("IDK"),
              title: "My Eposides",
              previewElments: (() async {
                var x = await SpotifyApiSingelton.getSpotInstance()
                    .me
                    .savedEpisodes()
                    .all();
                return x.map((e) => PreviewCard(
                    defaultImage: "assets/images/no_playlist.jpg",
                    imageUrl: e.images?.firstOrNull?.url,
                    further: const Text("IDK"),
                    title: e.name ?? "IDK"));
              })(),
            ),
            PreviewSection(
              nextScreen: const Text("IDK"),
              title: "My Shows",
              previewElments: (() async {
                var x = await SpotifyApiSingelton.getSpotInstance()
                    .me
                    .savedShows()
                    .all(10);
                return x.map((e) => PreviewCard(
                    defaultImage: "assets/images/no_playlist.jpg",
                    imageUrl: e.images?.firstOrNull?.url,
                    further: const Text("IDK"),
                    title: e.name ?? "IDK"));
              })(),
            ),
            PreviewSection(
              nextScreen: const Text("IDK"),
              title: "Recommended PlayLists",
              previewElments: (() async {
                return (await SpotifyApiSingelton.getSpotInstance()
                        .playlists
                        .featured
                        .all(5))
                    .take(5)
                    .map((e) => PreviewCard(
                        defaultImage: "assets/images/no_playlist.jpg",
                        imageUrl: e.images?.firstOrNull?.url,
                        further: const Text("IDK"),
                        title: e.name ?? "IDK"));
              })(),
            ),
            PreviewSection(
              nextScreen: const Text("IDK"),
              title: "Recommended Artist",
              previewElments: (() async {
                return (await SpotifyApiSingelton.getSpotInstance()
                        .me
                        .topArtists()
                        .all(5))
                    .take(5)
                    .map((e) => PreviewCard(
                        defaultImage: "assets/images/no_playlist.jpg",
                        imageUrl: e.images?.firstOrNull?.url,
                        further: const Text("IDK"),
                        title: e.name ?? "IDK"));
              })(),
            ),
            PreviewSection(
              nextScreen: const Text("IDK"),
              title: "Recommended Albums",
              previewElments: (() async {
                return (await SpotifyApiSingelton.getSpotInstance()
                        .me
                        .topTracks()
                        .all(5))
                    .take(5)
                    .map((e) => e.album)
                    .map((e) => PreviewCard(
                        defaultImage: "assets/images/no_playlist.jpg",
                        imageUrl: e?.images?.firstOrNull?.url,
                        further: const Text("IDK"),
                        title: e?.name ?? "IDK"));
              })(),
            ),
            PreviewSection(
              nextScreen: const Text("IDK"),
              title: "Recently Played Albums",
              previewElments: (() async {
                var spotify = SpotifyApiSingelton.getSpotInstance();
                var data = (await spotify.me.recentlyPlayed(limit: 50).all(5))
                    .take(50)
                    .map((e) async =>
                        (await spotify.tracks.get(e.track!.id!)).album);
                var res = Map<String?, AlbumSimple?>();
                for (var i in data) {
                  if (res.length >= 5) {
                    break;
                  }
                  var element = await i;
                  res[element?.id] = element;
                }
                Iterable<AlbumSimple?> resF = res.values.take(5);
                return resF.map((e) => PreviewCard(
                    defaultImage: "assets/images/no_playlist.jpg",
                    imageUrl: e?.images?.first.url,
                    further: const Text("IDK"),
                    title: e?.name ?? "IDK"));
              })(),
            ),
          ],
        ));
  }
}
