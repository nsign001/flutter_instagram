import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/sign_in_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const String id = "splash_page";
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  /// from splash to sign in page
  void _openPage() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, SignInPage.id);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _openPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // #instagram icon
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: Image(
              image: const AssetImage('assets/images/instagram_icon.png'),
              height: MediaQuery.of(context).size.width * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
            ),
          ),

          // #instagram company logo
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // #text
                Text("from", style: TextStyle(fontSize: 16, color: Colors.grey.shade900, fontFamily: "Billabong"),),

                // #company logo
                Image(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.3,
                  image: const AssetImage('assets/images/img.png'),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
