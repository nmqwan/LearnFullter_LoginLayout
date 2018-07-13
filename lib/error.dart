class ErrorApi {
  bool _status;

//  @export
  String _error;

  bool get status => _status;

  set status(bool value) {
    _status = value;
  }

  @override
  String toString() {
    return 'Error{status: $_status, error: $_error}';
  }

  ErrorApi.map(dynamic obj) {
    this.status = obj["status"];
    this.error = obj["error"];
  }

  String get error => _error;

  set error(String value) {
    _error = value;
  }
}
