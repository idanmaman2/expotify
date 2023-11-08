import 'package:flutter/material.dart';
import 'package:igals_expotify/design/color.dart';

class PreviewCard extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final Widget further;
  final String? defaultImage;

  const PreviewCard(
      {required this.imageUrl,
      required this.title,
      required this.further,
      required this.defaultImage,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: spotifyMain,
      color: spotifyMain.withAlpha(50),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: (imageUrl == null
                ? Image.asset(defaultImage!, fit: BoxFit.fill)
                : Image.network(
                    imageUrl!,
                    fit: BoxFit.fill,
                  )),
          ),
          Expanded(
              flex: 1,
              child: Center(
                  child: Text(title,
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)))),
        ],
      ),
    );
  }
}
