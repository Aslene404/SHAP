import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shap/features/login/data/models/user_model.dart';
import 'package:shap/features/login/presentation/bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class XingWidget extends StatefulWidget {
  const XingWidget({Key? key}) : super(key: key);

  @override
  State<XingWidget> createState() => _XingWidgetState();
}

class _XingWidgetState extends State<XingWidget> {
  @override
  Widget build(BuildContext context) {
    late UserModel user; // initiated user info

    Future<void> dispatchConcrete_xing() async {
      print(user.toJson());
      SharedPreferences prefs;
      prefs =
          await SharedPreferences.getInstance(); // initiate SharedPreferences
      prefs.setString(
          "CACHED_USER", user.toJson().toString()); //caching obtained result
      var x = prefs.getString("CACHED_USER"); //caching operation verification
      print(x);
      BlocProvider.of<LoginBloc>(context).add(LoginXingProcess());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Xing Initiated '),
        ),
      );
    }

    String? xing_first_name; // obtained xing's user first name from widget
    String? xing_last_name; // obtained xing's user last name from widget
    String? xing_email; // o
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 200,
          child: WebViewPlus(
            backgroundColor: Colors.transparent,
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: Set.from([
              JavascriptChannel(
                  name: 'first_name',
                  onMessageReceived: (JavascriptMessage message) {
                    print(message
                        .message); // java script variable named "first_name" returned by the webview
                    xing_first_name = message
                        .message; //collect the recieved variable into dart variable
                  }),
              JavascriptChannel(
                  name: 'last_name',
                  onMessageReceived: (JavascriptMessage message) {
                    print(message
                        .message); // java script variable named "last_name" returned by the webview
                    xing_last_name = message
                        .message; //collect the recieved variable into dart variable
                  }),
              JavascriptChannel(
                  name: 'email',
                  onMessageReceived: (JavascriptMessage message) {
                    print(message
                        .message); // java script variable named "email" returned by the webview
                    xing_email = message
                        .message; //collect the recieved variable into dart variable
                  }),
              JavascriptChannel(
                  name: 'done',
                  onMessageReceived: (JavascriptMessage message) async {
                    print(message
                        .message); // java script variable named "done" returned by the webview to mark the completion of collecting the user info
                    user = UserModel(
                      first_name: xing_first_name,
                      last_name: xing_last_name,
                      email: xing_email,
                    ); //building user model using obtained xing user info
                    dispatchConcrete_xing();
                  }),
            ]),
            onWebViewCreated: (controller) {
              controller.loadUrl(
                  'assets/xing_login_plugin.html'); //local webview page
            },
          ),
        ),
      ],
    );
  }
}
