import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:souq/components/SignCard.dart';
import 'package:souq/components/customTextField.dart';
import 'package:souq/constants.dart';






class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;



    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor ,
        title: Image.asset("assets/icons/shopify.png",width: 120,),
centerTitle:true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: height * 0.17,
            left: width * 0.060,
            right: width * 0.060,
          ),
          child: Column(
            children: <Widget>[
              SignCard(
                  buttonFunction: () {
                    print('sign up');
                  },
                  firstLeft: 'Sign Up',

                  buttonText: "SIGN UP",
                  firstTextContainerheader: 'Name',
                  secondTextContainerheader: 'Your Email',
                  firstTextContainerHintText: "Marc",
                  secondTextContainerHintText: "iamMarc@hotmailcom",


                  firstRightPress: (){},


                  child: Column(children: <Widget>[
                    SizedBox(
                      height: height * 0.023,
                    ),
                    CustomTextField(
                        heading: 'Password',
                        hintText: 'Your Password',
                        obscure: true)
                  ]))
            ],
          ),
        ),
      ),
    );;
  }
}
