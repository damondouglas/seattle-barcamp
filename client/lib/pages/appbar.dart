import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show window;

AppBar appBar(BuildContext context, String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: _Title(),
    actions: <Widget>[
      FlatButton(
        child: Text(
          'FAQ',
          style: TextStyle(
            decoration: title == 'FAQ'
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
        onPressed: () => {Navigator.pushNamed(context, '/faq')},
      ),
    ],
  );
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => {Navigator.pushNamed(context, '/')},
      child: RichText(
        text: TextSpan(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            children: [
              TextSpan(
                text: 'BAR',
                style: TextStyle(
                  color: Colors.lightBlue,
                ),
              ),
              TextSpan(text: 'CAMP'),
            ]),
      ),
    );
  }
}

final bottomAppBar = BottomAppBar(
  child: Padding(
    padding: EdgeInsets.all(8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text('Made using '),
        InkWell(
            onTap: () => {
              window.open("https://flutter.dev", "")
            },
            child: Image.asset('assets/images/flutter.png', height: 32, width: 32,)
        ),
        Text('here: '),
        InkWell(
            onTap: () => {
              window.open("https://github.com/damondouglas/seattle-barcamp", "")
            },
            child: Image.asset('assets/images/github.png', height: 32, width: 32,)
        ),
      ],
    ),
  ),
);

class _Link extends StatelessWidget {
  final String content;
  final String url;
  _Link({@required this.content, @required this.url});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(' '),
        InkWell(
          onTap: () => {
            window.open(this.url, "")
          },
          child: Text(this.content,
              style: TextStyle(
                color: Colors.blueAccent,
                decoration: TextDecoration.underline,
              )),
        )
      ],
    );
  }
}
