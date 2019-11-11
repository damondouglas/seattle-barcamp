import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show window;

const googleCalendarURL = "http://www.google.com/calendar/event?action=TEMPLATE&dates=20191213T200000Z%2F20191214T020000Z&text=BarCamp%20Seattle&location=Makers%20Workspaces%2092%20Lenora%20St%2C%20Seattle%2C%20WA&details=Come%20join%20us%20for%20this%20year's%20BarCamp%20Seattle!%0Ahttps%3A%2F%2Fbarcampseattle.com";
const otherCalendarURL = "https://storage.googleapis.com/barcamp-12-13/BarCampSeattle2019.ics";

enum Provider {
  Google,
  Other
}

void openOther() => window.open(otherCalendarURL, "");
void openGoogle() => window.open(googleCalendarURL, "");

Future<void> chooseProvider(BuildContext context) async {
  switch(await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Add to calendar'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () => {
                Navigator.pop(context, Provider.Google)
              },
              child: Text('Google'), // TODO: brand this
            ),
            SimpleDialogOption(
              onPressed: () => {
                Navigator.pop(context, Provider.Other)
              },
              child: Text('Other'), // TODO: make pretty
            ),
          ],
        );
      }
  )) {
    case Provider.Google:
      openGoogle();
      break;
    case Provider.Other:
      openOther();
      break;
  }
}
