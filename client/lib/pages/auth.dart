import 'package:barcamp/main.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthNotifier extends ChangeNotifier {
  fb.UserCredential credential;
  void set(fb.UserCredential credential) {
    this.credential = credential;
    notifyListeners();
  }
}

class Auth extends StatelessWidget {
  final fb.Auth auth;
  Auth(this.auth);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<fb.UserCredential> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Container();
          case ConnectionState.done:
            Provider.of<AuthNotifier>(context, listen: false).set(snapshot.data);
        }
        return Container();
      },
    );
  }
}

void signIn(BuildContext context, fb.Auth auth, fb.AuthProvider provider) async {
  var credentials = await auth.signInWithPopup(provider);
  Provider.of<AuthNotifier>(context, listen: false).set(credentials);
}

Future<void> chooseProvider(BuildContext context, fb.Auth auth) async {
  final google = fb.GoogleAuthProvider();
  final github = fb.GithubAuthProvider();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('Sign in to recieve the calendar event invite'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () => {
              Navigator.pop(context),
            },
            child: Text('Google', textAlign: TextAlign.center,), //TODO: make this a pretty branded image
          ),
          SimpleDialogOption(
            onPressed: () => {
              Navigator.pop(context),
            },
            child: Text('GitHub', textAlign: TextAlign.center,), //TODO: make this a pretty branded image
          )
        ],
      );
    }
  );
}


