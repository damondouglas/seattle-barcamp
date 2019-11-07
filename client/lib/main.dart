import 'dart:convert';

import 'package:barcamp/pages/faq.dart';
import 'package:barcamp/pages/home.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';

void main() => runApp(App());

final themeData = ThemeData(
  fontFamily: 'Montserrat',
  appBarTheme: AppBarTheme(
    color: Color(0xFFFFF7),
  ),
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/firebase/config.json"),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
          case ConnectionState.active:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            var config = json.decode(snapshot.data);
            var apiKey = config['apiKey'];
            var authDomain = config['authDomain'];
            var databaseURL = config['databaseURL'];
            fb.Auth auth;
            try {
              fb.initializeApp(
                apiKey: apiKey,
                authDomain: authDomain,
                databaseURL: databaseURL,
              );
              auth = fb.auth();
            } catch(e) {
              return Container(
                child: Center(
                  child: Text(e.toString()),
                ),
              );
            }
            return loadAuthenticatedWidget(context, auth);
        }
        return null;
      },
    );
  }
}

class Authenticated extends InheritedWidget {
  final fb.Auth auth;
  final Widget child;
  Authenticated(this.auth, {@required this.child});
  @override
  bool updateShouldNotify(Authenticated oldWidget) {
    return this.auth != oldWidget.auth;
  }

  static Authenticated of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(Authenticated) as Authenticated;

}

Authenticated loadAuthenticatedWidget(BuildContext context, fb.Auth auth) {
  return Authenticated(
    auth,
    child: MaterialApp(
      theme: ThemeData(
          fontFamily: 'Montserrat',
          appBarTheme: AppBarTheme(
            color: Color(0xFFFFF7),
          ),
          textTheme: TextTheme(
              headline: TextStyle(
                fontSize: 15.0,
              ),
              title: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              )
          )
      ),
      title: 'BarCamp Seattle 2019',
      routes: {
        '/': (context) => HomePage(),
        '/faq': (context) => FaqPage(),
      },
    ),
  );
}