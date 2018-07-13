import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'service.dart';
import 'home.dart';
import 'User.dart';
import 'error.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
  final key = new GlobalKey<ScaffoldState>();
  bool _isLoading = false;

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

  _rememberRegister(context) {
    return Container(
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Forgot Password", style: TextStyle(color: Colors.blue)),
                  Image(
                    image: AssetImage("images/logo.png"),
                    color: Colors.blue,
                    height: 30.0,
                    width: 30.0,
                  )
                ],
              ),
              onTap: () => _forgotPassword(context),
            ),
          ),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: _register(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Register",
                    style: TextStyle(color: Colors.blue),
                  ),
                  Image(
                    image: AssetImage("images/logo.png"),
                    color: Colors.blue,
                    height: 30.0,
                    width: 30.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _onLogin() {
    setState(() {
      _isLoading=true;
    });
    Service service = new Service();
    service.login(_edtUsername.text, _edtPassword.text).then((u) {
      setState(() {
        _isLoading=false;
      });
      if (u is User) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(u.token),
            ));
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => Home(u.token),
//          ),
//        );
      } else {
        Scaffold
            .of(context)
            .showSnackBar(SnackBar(content: Text(u.toString())));
      }
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      opacity: 0.5,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
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
                    padding: EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: <Widget>[
                        _createLoginContainer(context),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: _rememberRegister(context),
                        )
                      ],
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }

  _forgotPassword(context) {
    setState(() {
      Scaffold
          .of(context)
          .showSnackBar(SnackBar(content: Text('Forgot password')));
    });
  }

  _register() {}
}
