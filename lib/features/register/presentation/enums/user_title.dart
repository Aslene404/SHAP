import 'package:easy_localization/easy_localization.dart';

import '../../../../global/translation/generated/locale_keys.g.dart';

enum UserTitle { dr, prof }

extension UserGenderExtension on UserTitle {
  String get title {
    switch (this) {
      case UserTitle.dr:
        return LocaleKeys.enums_title_doctor.tr();
      case UserTitle.prof:
        return LocaleKeys.enums_title_professor.tr();
    }
  }
}

UserTitle getUserTitleFromString(String gender) => UserTitle.values
    .firstWhere((f) => f.name == gender, orElse: () => UserTitle.dr);
