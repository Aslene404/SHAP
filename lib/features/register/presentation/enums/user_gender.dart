import 'package:easy_localization/easy_localization.dart';

import '../../../../global/translation/generated/locale_keys.g.dart';

enum UserGender { male, female }

extension UserGenderExtension on UserGender {
  String get title {
    switch (this) {
      case UserGender.male:
        return LocaleKeys.enums_gender_mr.tr();
      case UserGender.female:
        return LocaleKeys.enums_gender_mrs.tr();
    }
  }
}

UserGender getUserGenderFromString(String gender) => UserGender.values
    .firstWhere((f) => f.name == gender, orElse: () => UserGender.male);
