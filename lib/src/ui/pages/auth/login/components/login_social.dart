part of './components.dart';

class SocialButtons extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox.fromSize(
          size: const Size(32, 32),
          child: ClipOval(
            child: Material(
              color: Colors.white,
              child: InkWell(
                  splashColor: Theme.of(context).primaryColor,
                  onTap: _loginWithGoogle,
                  child: Image.asset('Assets/socials/google_search.png',
                      height: 16)),
            ),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox.fromSize(
          size: const Size(32, 32),
          child: ClipOval(
            child: Material(
              color: Colors.white,
              child: InkWell(
                splashColor: Theme.of(context).primaryColor,
                onTap: _loginWithFacebook,
                child: Image.asset('Assets/socials/facebook.png',
                    height: 16), // <-- Icon
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      if (kDebugMode) {
        print('People API ${response.statusCode} response: ${response.body}');
      }
      return;
    }
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = _pickFirstNamedContact(data);
    if (kDebugMode) {
      if (namedContact != null) {
        print('I see you know $namedContact!');
      } else {
        print('No contacts to display.');
      }
    }
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  Future<void> _loginWithGoogle() async {
    try {
      GoogleSignInAccount? user;
      _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
        user = account;
        if (user != null) {
          _handleGetContact(user!);
        }
        _googleSignIn.signInSilently();
      });
      user = await _googleSignIn.signIn();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  // Future<void> _handleSignOut() => _googleSignIn.disconnect();

  void _loginWithFacebook() async {
    // ignore: unused_local_variable
    Map<String, dynamic>? userData;
    AccessToken? _accessToken;
    _accessToken = await FacebookAuth.instance.accessToken;
    if (_accessToken != null) {
      userData = await FacebookAuth.instance.getUserData(
          fields:
              "id,first_name,last_name,middle_name,about,birthday,picture,email,gender,languages,link");
    } else {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        _accessToken = result.accessToken;
        userData = await FacebookAuth.instance.getUserData(
            fields:
                "id,first_name,last_name,middle_name,about,birthday,picture,email,gender,languages,link");
      }
    }
  }
}
