
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq/components/customTextField.dart';
import 'package:souq/constants.dart';
import 'package:souq/core/view_model/home_view_model.dart';


// final categoryRef = FirebaseFirestore.instance.collection('Categories') ;
//
// class homeScreen extends StatefulWidget {
//
//
//   late String? email;
//   late String? name;
//   late String? pic;
//
//   final TextController1 = TextEditingController();
//
//   homeScreen({Key? key,
//     this.email,
//     this.name,
//     this.pic,
//
//   }) : super(key: key);
//
//
//
//
//   @override
//   _homeScreenState createState() => _homeScreenState();
// }
//
// class _homeScreenState extends State<homeScreen> {
//
//   @override
//   void initState() {
//     getCategory();
//
// super.initState();
//   }
//
//
//   getCategory(){
//     categoryRef.get().then((QuerySnapshot snapshot) {
//       snapshot.docs.forEach((DocumentSnapshot doc) {
//
//         print(doc.data);
//
//       });
//     });
//   }
//
//
//
//   final List<String> names = <String>[
//     'Men',
//     'Women',
//     'Devices',
//     'Gadgets',
//     'Gaming',
//     's',
//     's',
//     "s",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     var height = size.height;
//     var width = size.width;
//
//     return Scaffold(
//
//
// //         appBar: AppBar(
// //           backgroundColor: Colors.grey.shade50,
// //           centerTitle: true,
// //           elevation: 0,
// // flexibleSpace:   Column(
// //   children :[
// //     SizedBox(height: height * 0.009,),
// //     Image.asset(
// //   "assets/icons/shopify.png",
// //   width: 120,
// //
// // ),
// //     textFormField()
// //
// //   ]
// // ),
// // toolbarHeight: height * .150,
// //           // flexibleSpace:
// //
// //           // Container(
// //           //   child: Column(children: <Widget>[
// //           //     SizedBox(height: height * 0.02,),
// //           //    Image.asset(
// //           //       "assets/icons/shopify.png",
// //           //       width: 120,
// //           //     ),
// //           //     Container(
// //           //         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
// //           //         child:  textFormField()),
// //           //   ]),
// //           // ),
// //
// //
// //         ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.only( left: 20, right: 10),
//           child: Column(
//             children: <Widget>[
//
//
//
//
//               //textfield
//               // textFormField(),
//
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     "Categories",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'first'),
//                   )),
//               SizedBox(
//                 height: 30,
//               ),
//
//
//               //listview
//               ListViewCategories(names: names, ),
//               SizedBox(
//                 height: 40,
//               ),
//
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text('Best Selling', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w600)),
//                   FlatButton(
//                       onPressed: (){print('see all');},
//                       child: Text('See All', style: TextStyle( fontSize: 17))),
//
//
//
//                 ],),
//               SizedBox(
//                 height: 30,
//
//               ),
//
//
//               ListViewProducts(names: names),
//               SizedBox(height: 1000,)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//















class homeScreen extends  GetWidget<HomeViewModel> {




  final List<String> names = <String>[
    'Men',
    'Women',
    'Devices',
    'Gadgets',
    'Gaming',
    's',
    's',
    "s",
  ];





  //
   String email;
   String name;
   String pic;

  final TextController1 = TextEditingController();

  homeScreen({
    Key key,
     this.email,
    this.name,
    this.pic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;
    return GetBuilder<HomeViewModel>(
      builder: (controller)=>

      controller.loading.value == true ? Center(child: CircularProgressIndicator()) :

      Scaffold(



          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only( left: 20, right: 10),
              child: Column(
                children: <Widget>[




                  //textfield
                  // textFormField(),

                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Categories",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'first'),
                      )),
                  SizedBox(
                    height: 30,
                  ),


                  //listview
                  ListViewCategories(names: names, ),
                  SizedBox(
                    height: 40,
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text('Best Selling', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w600)),
                         FlatButton(
                             onPressed: (){print('see all');},
                             child: Text('See All', style: TextStyle( fontSize: 17))),



                  ],),
                  SizedBox(
                    height: 30,

                  ),


                  ListViewProducts(names: names),
                  SizedBox(height: 1000,)
                ],
              ),
            ),
          ),
        ),
    );

  }


}



class ListViewProducts extends StatelessWidget {
  const ListViewProducts({
    Key key,
     this.names,
  }) : super(key: key);

  final List<String> names;


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;
    return



      GetBuilder<HomeViewModel>(
        builder:(controller) => Container(

        height: 345,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.productModel.length,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        //color of shadow
                        spreadRadius: 1,
                        //spread radius
                        offset:
                        Offset(0, 001), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                    color: Colors.white),
                height: height * .356,
                width: width * .36,
                child: Column(
                  children:<Widget> [

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(

                          child:  (controller.productModel[index].pic == null)
                              ? Image.asset('assets/homeview/product2.png',width: 250,)

                              : Image.network(controller.productModel[index].pic,fit: BoxFit.cover,height: 150,
                            loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null ?
                                  loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                          ),
                      ),
                    ),

                    // Padding(
                    //   padding: EdgeInsets.all(10),
                    //   child: Container(
                    //
                    //    child:  (controller.productModel[index].pic == null)
                    //        ? Image.asset('assets/homeview/product2.png',width: 250,)
                    //        : Image.network(controller.productModel[index].pic,fit: BoxFit.cover,height: 150,)
                    //   ),
                    // ),
                    SizedBox(height: height * 0.003,),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                        alignment: Alignment.topLeft,
                        child: Text(controller.productModel[index].name,style: TextStyle(fontSize: 17),)),

                    Container(
                        padding: EdgeInsets.only(left: 5),
                        alignment: Alignment.topLeft,
                        child: Text(controller.productModel[index].description,style: TextStyle(fontSize: 13, color: Colors.grey),)),

                    Container(
                        padding: EdgeInsets.only(left: 5, top: 10),
                        alignment: Alignment.topLeft,
                        child: Text('${controller.productModel[index].price} EGP',style: TextStyle(fontSize: 17, color: kPrimaryColor),)),


                  ],

                )
              ),

            ]);
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
    ),
      );
  }
}

class ListViewCategories extends StatelessWidget {
   ListViewCategories({
    Key key,

     this.names,
  }) : super(key: key);

  final List<String> names;

  final List <String> imgs = <String> [
    'assets/homeview/Icon_Mens Shoe.png',
    'assets/homeview/women.png',
    'assets/homeview/Devices.png',
    'assets/homeview/Icon_Gadgets.png',
    'assets/homeview/Icon_Gaming.png',
    'assets/homeview/Icon_Gaming.png',
    'assets/homeview/Icon_Gaming.png',
    'assets/homeview/Icon_Gaming.png',



  ];




  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder:(controller) => Container(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryModel.length,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              InkWell(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          //color of shadow
                          spreadRadius: 0.1,
                          //spread radius
                          offset:
                              Offset(0, 001), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                        //you can set more BoxShadow() here
                      ],
                      borderRadius: BorderRadius.circular(55),
                      color: Colors.white),
                  height: 60,
                  width: 60,
                  child: Padding(
                      padding: EdgeInsets.all(1),
                      child:(controller.categoryModel[index].pic == null) ? Image.asset(imgs[index]) : Image.network(controller.categoryModel[index].pic) ) ,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(controller.categoryModel[index].name)
            ]);
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}

class textFormField extends StatelessWidget {
  const textFormField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade300,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }
}
