import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:souq/components/SignCard.dart';
import 'package:souq/components/orDivider.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: height * 0.17,
            left: width * 0.060,
            right: width * 0.060,
          ),
          child: Column(children: <Widget>[
            SignCard(
                firstLeft: 'Welcome,',
                firstRight: 'Sign Up',
                secondColumnText: 'Sign In To Continue',
                firstRightPress: () {
                  print('helloooo');
                },
                firstTextContainerheader: "Your Email",
                secondTextContainerheader: "Password",
                firstTextContainerHintText: "iamMarc@hotmail.com",
                secondTextContainerHintText: "Password",
                forgotPassword: 'Forgot Password?',
                buttonText: 'SIGN IN',
                buttonFunction: () {
                  print('signin');
                },
                child: SizedBox(
                  height: 0,
                )),
            orDivider(width: 0.06),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
              ),
              child: ListTile(
                onTap: (){print('sign in facebook');},
                title: Text('Sign In With Facebook'),
                leading: SvgPicture.asset(
                  "assets/icons/facebook.svg",
                  color: kPrimaryColor,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
              ),
              child: ListTile(
                onTap: (){print('sign in google');},
                title: Text('Sign In With Facebook'),
                leading: SvgPicture.asset(
                  "assets/icons/google-plus.svg",
                  width: 33,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
    ;
  }
}
