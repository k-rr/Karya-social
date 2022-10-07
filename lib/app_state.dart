import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _numoflikes = prefs.getInt('ff_numoflikes') ?? _numoflikes;
    _likes = prefs.getInt('ff_likes') ?? _likes;
  }

  late SharedPreferences prefs;

  int _numoflikes = 10;
  int get numoflikes => _numoflikes;
  set numoflikes(int _value) {
    _numoflikes = _value;
    prefs.setInt('ff_numoflikes', _value);
  }

  int _likes = 0;
  int get likes => _likes;
  set likes(int _value) {
    _likes = _value;
    prefs.setInt('ff_likes', _value);
  }

  String usersearch = '';
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
