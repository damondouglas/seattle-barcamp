import 'package:barcamp/pages/appbar.dart';
import 'package:barcamp/pages/home.dart';
import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show window;

class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'FAQ'),
      body: _Body(),
      bottomNavigationBar: bottomAppBar,
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = isMobileDevice(context);
    return Center(
      child: SingleChildScrollView(
        child: Wrap(
          children: <Widget>[
            _InfoCard(
              'What is BarCamp?',
              'BarCamp is an international network of user-generated conferences primarily focused around technology and the web. They are open, participatory workshop-events, the content of which is provided by participants.',
              'assets/images/whatis.jpg',
              [
                _Credit(
                  content: 'wikipedia',
                  url: 'https://en.wikipedia.org/wiki/BarCamp',
                ),
                _Credit(
                  content: 'mentatdgt',
                  url:
                      'https://www.pexels.com/photo/woman-sitting-on-gray-chair-1543895/',
                )
              ],
            ),
            _InfoCard(
                'Will there be stickers?',
                'Yes :-)',
                'assets/images/stickers.png', [])
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;
  final List<_Credit> credits;

  _InfoCard(this.title, this.content, this.imagePath, this.credits);

  @override
  Widget build(BuildContext context) {
    final children = List<Widget>();
    if (this.credits.length > 0) {
      children
        ..add(Text(
          'credits',
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
        ))
        ..add(Text(':'))
        ..addAll(this.credits);
    }
    return SizedBox(
      width: 400,
      height: 500,
      child: Card(
        child: Column(
          children: <Widget>[
            Image.asset(
              this.imagePath,
              width: 400,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                this.title,
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                this.content,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: children,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Credit extends StatelessWidget {
  final String content;
  final String url;

  _Credit({@required this.content, @required this.url});

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

