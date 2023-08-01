class Branch{
  String _name;
  int _id;
  String _tel;
  double _lat;
  double _lng;
  String _manager;

  Branch(this._name, this._id, this._tel, this._lat, this._lng, this._manager);

  String get manager => _manager;

  set manager(String value) {
    _manager = value;
  }

  double get lng => _lng;

  set lng(double value) {
    _lng = value;
  }

  double get lat => _lat;

  set lat(double value) {
    _lat = value;
  }

  String get tel => _tel;

  set tel(String value) {
    _tel = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}

