import 'package:flutter/material.dart';
import 'package:iconfezz/PredefinedFiles/appConstatant.dart';
import 'package:iconfezz/PredefinedFiles/appLocalization.dart';
import 'package:iconfezz/ProviderModel/LoginProviderModel.dart';
import 'package:iconfezz/Views/Widgets/AppBarWidget.dart';
import 'package:provider/provider.dart';

class LoginByEmailPage extends StatelessWidget {
  static String tag = 'LoginByEmail';

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context);
    return Directionality(
      textDirection: isRightToLeft ? TextDirection.rtl : TextDirection.ltr,
      child: SafeArea(
        bottom: false,
        child: ChangeNotifierProvider(
          create: (context) => LoginProviderModel(),
          child: Scaffold(
              key: _scaffoldKey,
              appBar: PreferredSize(
                  preferredSize: Size(double.infinity, 0.50),
                  child: ConfezzAppBar(
                      appLocalizations.getMessageByLangAndKey(
                          appLanguageCode, 'lgn'),
                      false)),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    //Login form Logo, Email/Password Textbox and message Textbox
                    LogInFormWidget(),
                    //Forget and SignUp buttons row
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, right: 5, left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                              child: Text(
                                  appLocalizations.getMessageByLangAndKey(
                                      appLanguageCode, 'frgtpswrd'),
                                  style: TextStyle(
                                      fontSize: appfontSize,
                                      color: Colors.green,
                                      decoration: TextDecoration.underline)),
                              onTap: () {
                                //Navigator.pushNamed(context, ForgotPassword.tag);
                                // TODO: Navigate to forget Password
                              }),
                          InkWell(
                              child: Text(
                                  appLocalizations.getMessageByLangAndKey(
                                      appLanguageCode, 'sgnup'),
                                  style: TextStyle(
                                      fontSize: appfontSize,
                                      color: Colors.green,
                                      decoration: TextDecoration.underline)),
                              onTap: () {
                                // Navigator.pushNamed(context, SignUpPage.tag);
                                // TODO : Sign Up
                              }),
                        ],
                      ),
                    ),
                    //Login Button
                    LoginButtonWiget(),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class LoginButtonWiget extends StatelessWidget {
  const LoginButtonWiget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context);
    var _provider = Provider.of<LoginProviderModel>(context);

    return Container(
      padding: const EdgeInsets.only(top: 30),
      //width: _width,
      child: RaisedButton(
        color: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            5.0,
          ),
        ),
        child: Text(
            appLocalizations.getMessageByLangAndKey(appLanguageCode, 'lgn'),
            style: TextStyle(fontSize: appfontSize, color: Colors.white)),
        onPressed: () {
          _provider.checkLogin(context);
        },
        elevation: 4,
      ),
    );
  }
} //end of login button widget

class LogInFormWidget extends StatelessWidget {
  const LogInFormWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context);
    final double paddingFromTop = MediaQuery.of(context).size.height / 4;

    return Consumer<LoginProviderModel>(
      builder: (context, _provider, _) {
        return Padding(
          padding: EdgeInsets.only(top: paddingFromTop),
          child: Column(
            children: <Widget>[
              Container(
                height: 100.0,
                child: Image.asset('assets/logo3.png', height: 100, width: 100),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                initialValue: _provider.getEmail,
                cursorColor: Colors.green,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _provider.setEmail = value;
                },
                autofocus: true,
                decoration: InputDecoration(
                  hintText: appLocalizations.getMessageByLangAndKey(
                      appLanguageCode, 'eemlphn'),
                  labelText: appLocalizations.getMessageByLangAndKey(
                      appLanguageCode, 'emlrph'),
                  labelStyle: TextStyle(color: Colors.green),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.green,
                  ),
                  contentPadding: EdgeInsets.all(10.0),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                initialValue: _provider.getPassword,
                cursorColor: Colors.green,
                autofocus: false,
                obscureText: true,
                onChanged: (value) {
                  _provider.setPassowrd = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  hintText: appLocalizations.getMessageByLangAndKey(
                      appLanguageCode, 'psswrd'),
                  labelText: appLocalizations.getMessageByLangAndKey(
                      appLanguageCode, 'psswrd'),
                  labelStyle: TextStyle(color: Colors.green),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.green,
                  ),
                  contentPadding: EdgeInsets.all(10.0),
                ),
                //errorText: ''
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Visibility(
                  visible: _provider.showMessage,
                  child: Text(
                    _provider.getResponseMessage,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: bigfontSize,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
