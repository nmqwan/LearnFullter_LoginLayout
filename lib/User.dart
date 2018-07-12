class User {
  String _username;
  String _password;
  String _token;

  String get username => _username;

  String get password => _password;

  String get token => _token;

  User.map(dynamic obj) {
    this._username = obj["username"];
    this._password = obj["password"];
    this._token = obj["token"];
  }

  @override
  String toString() {
    return 'User{_username: $_username, _password: $_password, _token: $_token}';
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    map["token"] = _token;

    return map;
  }
}
