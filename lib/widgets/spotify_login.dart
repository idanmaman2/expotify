import 'package:flutter/material.dart';
import 'package:igals_expotify/utils/data/spotify.dart';
import 'package:igals_expotify/utils/storage/spotify.dart';
import 'package:igals_expotify/widgets/providers/spotify_login_provider.dart';
import 'package:provider/provider.dart';
import 'package:spotify/spotify.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SpotifyLogin extends StatelessWidget {
  const SpotifyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //                                     <--- MultiProvider
      providers: [
        ChangeNotifierProvider<SpotifyLoginProvider>(
            create: (context) => SpotifyLoginProvider()),
      ],
      child: _SpotifyLogin(),
    );
  }
}


// ignore: must_be_immutable
class _SpotifyLogin extends StatelessWidget {

  var grant;
  var authUri;
  _SpotifyLogin() { 
    grant = SpotifyApi.authorizationCodeGrant(credentials , onCredentialsRefreshed: SpotifyStorageUtil.saveToken );
    authUri = grant.getAuthorizationUrl(
      Uri.parse(redirectUri),
      scopes: scopes, // scopes are optional
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Igals spotify export app ")),
      body: FutureBuilder(
          future: SpotifyStorageUtil.getGrant(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return Scaffold(
                  body: WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: authUri.toString(),
                    navigationDelegate: (navReq) {
                      if (navReq.url.startsWith(redirectUri)) {
                        SpotifyStorageUtil.loadToken(grant, navReq);
                        Provider.of<SpotifyLoginProvider>(context,
                                listen: false)
                            .nextScreen(context);
                        return NavigationDecision.prevent;
                      }
                      return NavigationDecision.navigate;
                    },
                  ),
                );
              }
              Provider.of<SpotifyLoginProvider>(context, listen: false)
                  .nextScreen(context)
                  .then((value) => print("cool shit "));
            }
            return const Center(child:FittedBox(child:CircularProgressIndicator()));
          }),
    );
  }
}
