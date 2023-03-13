import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';

class LinkedInWidget extends StatelessWidget {
  const LinkedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinkedInUserWidget(
      redirectUrl: "http://localhost.com/",
      clientId: "78elfqdodpa7zy",
      clientSecret: "8fpXJXmCSpUADDK4",
      onGetUserProfile:
          (UserSucceededAction linkedInUser) {
        print('Access token ${linkedInUser.user.token.accessToken}');
        print('First name: ${linkedInUser.user.firstName!.localized!.label}');
        print('Last name: ${linkedInUser.user.lastName!.localized!.label}');
      },
      onError: (UserFailedAction e) {
        print('Error: ${e.toString()}');
      },
    );
  }
}
