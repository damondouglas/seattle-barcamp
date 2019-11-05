import 'dart:math';

import 'package:barcamp/pages/appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, null),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final crossedOutStyle = TextStyle(
      decoration: TextDecoration.lineThrough,
      color: Colors.black45,
      fontSize: 35.0,
      fontFamily: 'RockSalt',
    );
    final normalStyle = TextStyle(
      color: Colors.black87,
      fontSize: 35.0,
      fontFamily: 'RockSalt',
    );
    final checkStyle = TextStyle(
      color: Colors.blueAccent,
      fontSize: 35.0,
      fontFamily: 'RockSalt',
    );
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _InfoCard('assets/images/cal.png', [
                'DECEMBER 13',
                '12 - 6 PM',
                ''
              ]),
              _InfoCard('assets/images/map.png', [
                'MAKERS',
                '92 LENORA ST',
                'SEATTLE'
              ])
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'X',
                style: normalStyle,
              ),
              Text(
                'speakers',
                style: crossedOutStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'X',
                style: normalStyle,
              ),
              Text(
                'audience',
                style: crossedOutStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '✔️',
                style: normalStyle,
              ),
              Text(
                'tech talks',
                style: normalStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '✔️',
                style: normalStyle,
              ),
              Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  Text(
                    'stickers',
                    style: normalStyle,
                  ),
                  Positioned(
                    right: -40,
                    child: Transform.rotate(
                      angle: pi / 8,
                      child: Opacity(
                        opacity: 0.7,
                        child: Image.asset(
                          'assets/images/froggie.png',
                          height: 50,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ],
                overflow: Overflow.visible,
              ),
            ],
          ),
          FlatButton(
            child: Text(
              'RSVP',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () => {},
            color: Colors.redAccent,
          )
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String imagePath;
  final List<String> content;
  _InfoCard(this.imagePath, this.content);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
//            child: Text(this.title, style: Theme.of(context).textTheme.headline),
          child: Column(
            children: this.content.map(
                    (String item) => Text(
                        item,
                      style: Theme.of(context).textTheme.headline,
                    )
            ).toList(),
          ),
          ),
          Image.asset(
              this.imagePath,
            width: 150,
          ),
        ],
      ),
    );
  }
}
