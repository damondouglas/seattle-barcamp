import 'package:barcamp/main.dart';
import 'package:barcamp/pages/auth.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RSVP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authenticated = Authenticated.of(context);
    return ChangeNotifierProvider(
      builder: (context) => AuthNotifier(),
      child: Column(
        children: <Widget>[
          Consumer<AuthNotifier>(
            builder: (context, auth, child) {
              if (auth.credential != null && auth.credential.user != null) {
                var user = auth.credential.user;
                return Text('Thank you, ${user.displayName}, the calendar event will be shared with you.');
              }
              return FlatButton(
                child: Text(
                  'ADD TO MY CALENDAR',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () => {
                  chooseProvider(context, authenticated.auth)
                },
                color: Colors.redAccent,
              );
            },
          )
        ],
      ),
    );
  }
}

