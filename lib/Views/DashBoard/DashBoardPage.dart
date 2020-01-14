import 'package:flutter/material.dart';
import 'package:iconfezz/PredefinedFiles/appConstatant.dart';

class DashBoardPage extends StatelessWidget {
  static final String tag = 'Dashboard';
  const DashBoardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Text('Welcome ' + userLoginModel.fullName),
        ),
      ),
    );
  }
}
