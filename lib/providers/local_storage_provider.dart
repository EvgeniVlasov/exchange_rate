import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

final class LocalStorageProvider {
  final SharedPreferences _prefs;

  LocalStorageProvider(this._prefs);

  static const String _ratesKey = 'rates_key';

  Future<bool> saveRates(Map<String, dynamic> rates) =>
      _prefs.setString(_ratesKey, jsonEncode(rates));

  Map<String, dynamic>? getRates() {
    final ratesString = _prefs.getString(_ratesKey);
    if (ratesString != null) {
      return jsonDecode(ratesString);
    }
    return null;
  }
}
