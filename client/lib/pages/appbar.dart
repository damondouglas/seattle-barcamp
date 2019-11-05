import 'package:flutter/material.dart';

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
