import 'package:animate_do/animate_do.dart';
import 'package:contact_book/core/viewmodels/splash.dart';
import 'package:contact_book/ui/screens/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onModelReady: (model) async {
        await model.getConfiguration();
      },
      builder: (context, model, index) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadeInDown(
                    child: SvgPicture.asset(
                      "assets/images/logo.svg",
                      width: 150,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(height: 100,),
                  SizedBox(
                    height: 100,
                    child: SpinKitWaveSpinner(
                      color: Colors.lightBlueAccent,
                      waveColor: Colors.blueAccent,
                      trackColor: Colors.lightBlue,
                      size: 70.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
