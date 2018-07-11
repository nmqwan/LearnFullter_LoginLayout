import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _edtUsername = new TextEditingController();
  final TextEditingController _edtPassword = new TextEditingController();

  _createLoginContainer(context) {
    return new Container(
      padding: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
      child: ButtonTheme(
        height: 40.0,
        child: Column(
          children: <Widget>[
            TextField(
              style: TextStyle(color: Colors.grey, fontSize: 20.0),
              controller: _edtUsername,
              decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.all(15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  prefixIcon: new Padding(
                    padding: const EdgeInsetsDirectional.only(end: 16.0),
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 32.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: TextField(
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
                controller: _edtPassword,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    prefixIcon: new Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 32.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Container(
                child: RaisedButton(
                  child: Text("Login", style: TextStyle(color: Colors.white)),
                  onPressed: () => _onLogin(),
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  color: Colors.deepOrangeAccent,
                  colorBrightness: Brightness.light,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _rememberRegister(context){

  }
  _onLogin() {
    print(_edtUsername.text);
    print(_edtPassword.text);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("images/background_login.png"),
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Image(
                  image: AssetImage("images/logo_login.png"),
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: _createLoginContainer(context),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
