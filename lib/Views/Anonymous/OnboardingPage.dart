import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import 'LangCountryPage.dart';

class OnboardingPage extends StatelessWidget {
  static final String tag = 'OnboardingPage';
  const OnboardingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> _pagesViewModel = [];
    _pagesViewModel.add(_createPageView(
        'Record', 'Share Your Ideas, Memories with your Voice.', Icons.mic));
    _pagesViewModel.add(_createPageView(
        'Listen', 'Listen to Other\'s Ideas, Experience.', Icons.headset));
    _pagesViewModel.add(_createPageView(
        'Enjoy', 'Always enjoy, Wherever you are', Icons.person_pin));
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: IntroViewsFlutter(
          _pagesViewModel,
          onTapDoneButton: () {
            Navigator.pushReplacementNamed(context, LangCountryPage.tag);
          },
          pageButtonsColor: Colors.green,
          pageButtonTextStyles: new TextStyle(
            color: Colors.green,
            fontSize: 16.0,
            fontFamily: "Regular",
          ),
        ),
      ),
    );
  }

  PageViewModel _createPageView(
      String title, String description, IconData icon) {
    return PageViewModel(
      bubbleBackgroundColor: Colors.green,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.orange,
                fontSize: 70,
                fontWeight: FontWeight.w700),
          ),
          Text(
            description,
            style: TextStyle(color: Colors.orange, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Icon(
        icon,
        size: 300.0,
        color: Colors.green,
      ),
    );
  }
}
