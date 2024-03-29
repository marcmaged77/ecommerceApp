import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:souq/components/button.dart';
import 'package:souq/constants.dart';
import 'package:souq/core/view_model/home_view_model.dart';
import 'package:souq/model/new/productModel.dart';
import 'package:souq/model/products_mode.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:souq/view/widgets/descriptionPage/description_page.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DetailScreen extends StatelessWidget {
  Product model;

  DetailScreen({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 17, right: 17, bottom: 18),
        child: Container(
          padding: EdgeInsets.only(
            left: width * 0.060,
            right: width * 0.060,
            bottom: height * 0.009,
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              //color of shadow
              spreadRadius: 0.1,
              //spread radius
              offset: Offset(0.2, 0.2), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
            //you can set more BoxShadow() here
          ], borderRadius: BorderRadius.circular(7), color: Colors.white),
          height: 60,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
            child:

                //price and add
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price
                Container(
                  padding: EdgeInsets.only(top: 9, left: 10),
                  child: Column(
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        model.price,
                        style: TextStyle(color: kPrimaryColor, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                //add
                Container(
                    padding: EdgeInsets.only(right: 10, top: 7),
                    child: button(
                      radius: 6,
                      text: 'ADD',
                      color: kPrimaryColor,
                      widthP: 0.3,
                      press: () {},
                      textColor: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  model.pic,
                  fit: BoxFit.fill,
                )),

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////after image//////////////////////////////////////////////////////////////////////////
            Container(
              padding: EdgeInsets.only(
                left: width * 0.060,
                right: width * 0.060,
              ),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        model.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 26,
                            fontFamily: "second"),
                      )),

                  Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Column(children: [
                        Text(
                          "${model.price} EGP",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 26,
                              fontFamily: "second"),
                        ),
                        Text(
                          "All Price include Vat",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: "second"),
                        ),
                        Text(
                          "FREE Shipping",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: "second"),
                        ),
                      ])),

                  Divider(
                    color: Colors.grey.shade700,
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  //Size And Colour
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey)),
                            child: Container(
                              padding: EdgeInsets.only(right: 9, left: 9),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Size",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    "M",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey)),
                          child: Container(
                            padding: EdgeInsets.only(right: 9, left: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Color",
                                  style: TextStyle(fontSize: 17),
                                ),
                                Container(
                                  width: 20,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xff1E6F5C)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  ListTile(
                    onTap: () {
                      Get.to(Description(
                        model: model,
                      ));
                    },
                    title: Text(
                      'Description',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                          fontFamily: "second"),
                    ),
                    subtitle: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')),
                    trailing: Padding(
                        padding: EdgeInsets.only(top: 70),
                        child: Icon(Icons.arrow_forward_ios)),
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      'Reviews & Comments',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                          fontFamily: "second"),
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),

                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: model.reviews.length,
                    padding: EdgeInsets.all(10),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.grey.shade400, width: 1)),
                        child: ListTile(
                          leading: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: model.reviews[index].pic != null
                                      ? NetworkImage(model.reviews[index].pic)
                                      : AssetImage('assets/avatar/unkown.jpg'),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60))),
                          ),
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  model.reviews[index].name == null
                                      ? 'User-90132'
                                      : model.reviews[index].name,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'second'),
                                ),
                                RatingBar(
                                    itemSize: 15,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    itemCount: 5,
                                    initialRating: 3,
                                    ratingWidget: RatingWidget(
                                      full: Image.asset(
                                          'assets/reviews/heart.png'),
                                      empty: Image.asset(
                                          'assets/reviews/heart_border.png'),
                                    ),
                                    onRatingUpdate: (rating) {
                                      print('heart');
                                    })
                              ]),
                          isThreeLine: true,
                          subtitle: Text(model.reviews[index].review),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  button(
                    widthP: 1,
                    text: "write a review",
                    press: () {
                      print("milva");
                      showCupertinoModalBottomSheet(
                          context: context,
                          builder: (context) => Scaffold(
                                appBar: AppBar(
                                  title: Text(
                                    'Write a Review',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  centerTitle: true,
                                  elevation: 0.0,
                                  leading: BackButton(
                                    color: Colors.black,
                                  ),
                                ),
                                body: Container(
                                  padding: EdgeInsets.only(
                                      left: width * 0.06,
                                      right: width * 0.06,
                                      top: height * 0.04),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          leading: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        model.pic)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(60))),
                                          ),
                                          title: Text(model.name),
                                          subtitle: Text(model.description),
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),

                                        Container(
                                            child: Text('Write Your Review')),

                                        SizedBox(
                                          height: 20,
                                        ),

                                        SizedBox(
                                          width: 400,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'placeholder text',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 40,
                                                      horizontal: 20),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),

                                        button(
                                          widthP: 2,
                                          text: 'Submit Your Review',
                                          press: () {},
                                          color: kPrimaryColor,
                                          textColor: Colors.white,
                                          radius: 10,
                                        )

                                        // Text('milva')
                                      ]),
                                ),
                              ));
                    },
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    radius: 10,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Divider(
                    color: Colors.grey.shade700,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'More Related Products',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          fontFamily: "second"),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Stack(
                      overflow: Overflow.visible,
                      children:[
                    Card(elevation: 1, child: ListViewProducts()),

                    Positioned(
                      left: -20,
                        top: 120,
                        child: Icon(Icons.arrow_back_ios_new)),
                    Positioned(
                        right: -20,
                        top: 120,child: Icon(Icons.arrow_forward_ios)),
                  ]),



                  SizedBox(
                    height: 1000,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class ListViewProducts extends StatelessWidget {
  const ListViewProducts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        //background
        height: 260,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.mostSelling.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Stack(
                children:[

                  Card(

                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Column(children: [
                    Stack(alignment: AlignmentDirectional.bottomStart, children: [

                      Container(
                          height: 160,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    controller.mostSelling[index].pic,
                                  ),
                                  fit: BoxFit.cover))),
                      Container(
                          decoration: BoxDecoration(color: Colors.red),
                          child: Container(
                              margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                              child: Text(
                                'Sale',
                                style: TextStyle(
                                    fontFamily: 'third',
                                    fontSize: 17,
                                    color: Colors.white),
                              )))
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Column(children: [
                      controller.mostSelling[index].name == null
                          ? Container(
                              alignment: Alignment.topLeft,
                              child: Text('Product 01-290',
                                  style: TextStyle(
                                      color: Color(0xFF575E67),
                                      fontFamily: 'second',
                                      fontSize: 14.0)),
                            )
                          : Container(
                              child: Text('${controller.mostSelling[index].name}',
                                  style: TextStyle(
                                    color: Color(0xFF575E67),
                                    fontFamily: 'second',
                                    fontSize: 16,
                                  )),
                            ),
                      Column(children: [
                        Container(
                          padding: EdgeInsets.only(right: 30, top: 1),
                          alignment: Alignment.topLeft,
                          child: Text('Elgible for Free Shipping',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'second',
                                fontSize: 13,
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 50, top: 2, bottom: 4),
                          child: Container(
                              decoration: BoxDecoration(color: kPrimaryColor),
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                  child: Text(
                                    'Fullfiled by Aramex',
                                    style: TextStyle(
                                        fontFamily: 'third',
                                        fontSize: 10,
                                        color: Colors.white),
                                  ))),
                        )
                      ]),
                      Container(
                        padding: EdgeInsets.only(right: 90, top: 1),
                        alignment: Alignment.topLeft,
                        child: Text(controller.mostSelling[index].price + ' EGP',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: 'second',
                                fontSize: 16)),
                      ),
                    ]),
                  ]),
                ),

              ]),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
        ),
      ),
    );
  }
}
