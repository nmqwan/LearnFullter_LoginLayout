import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String _token;

  Home(this._token);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("HOME"),
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Text('${_token}')],
        ),
      ),
    );
  }
}
