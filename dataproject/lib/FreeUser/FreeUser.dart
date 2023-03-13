import 'dart:convert';

import 'package:dataproject/FreeUser/FreeUserModel.dart';
import 'package:dataproject/Pagenation/Model/ModelClass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const base = "https://courtn.digitaezonline.com";
  static const user = base + "/api/users";

//
ScrollController _scrollController = new ScrollController();

  bool isLoading = false;

  List names =  [];



//
  // ---- Free User List Api : -----
  free() async {
    try {
    
      Response response = await http.get(
        Uri.parse(user),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer 1071|rD4rrYUYbKfeAIORnbfZchEZb0RDI90MEyNGeen1',
        },
        //body: jsonEncode({'email': emailverify, 'otp': otp})
      );
      print(response);
      print(response.statusCode);
      //print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        // var value = data['data']['data'].toString();
        // print(" VALUE IS : " + value);
        return FreeUserListModel.fromJson(data);
      } else {
        return Text('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
  //

//

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
// -------- Api Data : -------
            Expanded(
                child: FutureBuilder(
              future: free(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.data.data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(
                            snapshot.data.data.data[index].name.toString(),
                            //   names[index],
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )

                // Expanded(
                //   child: Container(
                //     // color: Colors.red,
                //     height: height * 0.5,
                //     width: width * 0.92,
                //     // height: 800,
                //     // width: 300,
                //     child: SwipeCards(
                //       matchEngine: _matchEngine!,
                //       itemBuilder: (BuildContext context, int index) {
                //         return Padding(
                //           padding: const EdgeInsets.all(20.0),
                //           child: Container(
                //             height: height * 0.4,
                //             width: width * 0.92,
                //             //   alignment: Alignment.bottomLeft,
                //             decoration: BoxDecoration(
                //                 image: DecorationImage(
                //                     image: AssetImage(images[index]),
                //                     fit: BoxFit.cover),
                //                 color: Colors.red,
                //                 borderRadius: BorderRadius.circular(30)),
                //             // padding: EdgeInsets.all(20),
                //             child: SingleChildScrollView(
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 // mainAxisSize: MainAxisSize.min,
                //                 children: [
                //                   SizedBox(
                //                     height: height * 0.49,
                //                     // height: 380,
                //                   ),
                //                   Row(
                //                     children: [
                //                       SizedBox(
                //                         width: 20,
                //                       ),
                //                       Text(
                //                         names[index],
                //                         style: TextStyle(
                //                             fontSize: 32,
                //                             color: Colors.white,
                //                             fontWeight: FontWeight.bold),
                //                       ),
                //                     ],
                //                   ),
                //                   Row(
                //                     children: [
                //                       SizedBox(
                //                         width: 20,
                //                       ),
                //                       Text(
                //                         '2.8 miles away',
                //                         style: TextStyle(
                //                           fontSize: 10,
                //                           color: Colors.white,
                //                           //  fontWeight: FontWeight.bold
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                   Row(
                //                     children: [
                //                       SizedBox(
                //                         width: 20,
                //                       ),
                //                       Text(
                //                         'Recently Active',
                //                         style: TextStyle(
                //                           fontSize: 10,
                //                           color: Colors.white,
                //                           //  fontWeight: FontWeight.bold
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                   BottomBar()
                //                 ],
                //               ),
                //             ),
                //           ),
                //         );
                //       },
                //       onStackFinished: () {
                //         return ScaffoldMessenger.of(context).showSnackBar(
                //             SnackBar(content: Text('The List is over')));
                //       },
                //     ),
                //   ),
                // ),
                //    BottomBar()
                )
          ],
        ),
      ),
    );
  }
}
