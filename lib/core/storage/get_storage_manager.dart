import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../domain/entities/auth_entity.dart';
import '../constants/app_constants.dart';
import '../constants/localization_constants.dart';

class GetStorageManager {

  final _box = GetStorage(storagePref);

  static const authorization = 'authorization';
  static const languageCode = 'languageCode';

  set auth(AuthEntity? auth) {

    if(auth == null) {
      _box.remove(authorization);
    }
    else {
      _box.write(authorization, json.encode(auth.toJson()));
    }
  }

  AuthEntity? get auth {
    var data = _box.read(authorization);
    return data == null ? data : AuthEntity.fromJson(json.decode(data as String));
  }

  set locale(Locale? locale) {

    if(locale == null) {
      _box.remove(languageCode);
    }
    else {
      _box.write(languageCode, '${locale.languageCode}_${locale.countryCode}');
    }
  }

  Locale get locale {

    var mLanguageCode = _box.read(languageCode);

    if(mLanguageCode == null) {
      return localeEnglish;
    }

    var results = appLocales.where((item) => '${item.locale.languageCode}_${item.locale.countryCode}' == mLanguageCode);

    if(results.isEmpty) {
      return localeEnglish;
    }

    return results.first.locale;
  }
}