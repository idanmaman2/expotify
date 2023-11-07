import 'package:spotify/spotify.dart';

const  scopes =  [
    'user-library-read',
    'user-read-currently-playing',
    'user-read-recently-played',
    'playlist-read-private',
    'user-top-read' , 
    'playlist-modify-private', 
    'playlist-modify-public',
    'playlist-read-collaborative',
    'user-library-modify',
    'user-read-email',
    'user-read-private'
  ];
const redirectUri = 'https://github.com/asimon655/dotNet5782_3715_6941';

final credentials = SpotifyApiCredentials("faacc54f879248a2b00b8d4acced093b", "5356a6e50a19497e84fa34b38136e1c4");