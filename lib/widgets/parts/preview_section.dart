import 'package:flutter/material.dart';
import 'package:igals_expotify/design/color.dart';
import 'package:igals_expotify/widgets/parts/provider/preview_section_provider.dart';
import 'package:provider/provider.dart';

class PreviewSection extends StatelessWidget {
  final Widget nextScreen;
  final Future<Iterable<Widget>> previewElments;
  final String title;
  const PreviewSection(
      {required this.nextScreen,
      required this.previewElments,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //                                     <--- MultiProvider
      providers: [
        ChangeNotifierProvider<PreviewSectionProvider>(
            create: (context) => PreviewSectionProvider()),
      ],
      child: _PreviewSection(
        title: title,
        previewElments: previewElments,
        nextScreen: nextScreen,
      ),
    );
  }
}

class _PreviewSection extends StatelessWidget {
  final Widget nextScreen;
  final Future<Iterable<Widget>> previewElments;
  final String title;

  const _PreviewSection(
      {required this.nextScreen,
      required this.previewElments,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: const BoxDecoration(color: spotifyMain),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w800))),
            Expanded(
                child: TextButton(
                    onPressed: () => Provider.of<PreviewSectionProvider>(
                            context,
                            listen: false)
                        .nextScreen(context, nextScreen),
                    child: const Icon(
                      Icons.navigate_next_sharp,
                      size: 30,
                      color: Colors.black,
                    )))
          ],
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Center(
            child: FutureBuilder(
          future: previewElments,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...(snapshot.data as Iterable<Widget>),
                    InkWell(
                      onTap: () => Provider.of<PreviewSectionProvider>(context,
                              listen: false)
                          .nextScreen(context, nextScreen),
                      child: Card(
                        color: Colors.white24.withAlpha(155),
                        child: const Center(
                            child: CircleAvatar(
                                child: Icon(Icons.more_horiz_rounded))),
                      ),
                    )
                  ]
                      .map((e) => SizedBox(
                            child: e,
                            width: MediaQuery.of(context).size.width * 0.38,
                          ))
                      .toList());
            } else {
              return const CircularProgressIndicator();
            }
          },
        )),
      ),
    ]);
  }
}
