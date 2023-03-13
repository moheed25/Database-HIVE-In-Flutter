import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:build_runner/build_runner.dart';
// import 'package:hive_generator/hive_generator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Hive Database'),
      ),
      body: Column(
        children: [
// //
//           Expanded(
//             child: FutureBuilder(
//               future: Hive.openBox("Moheed"),
//               builder: (context, AsyncSnapshot snapshot) {
//                 print(snapshot.data .get('name').toString() ??  '');
//                 //print(snapshot.data.get('name').toString() ?? '');
//                 return
//                     // Text('1');
//                     //   print(snapshot.data!.get('name').toString());

//                     Column(
//                   children: [
//                     // Text(snapshot.data.get('name').toString() ?? ''),
//                     // Text(snapshot.data.get('age').toString() ?? ''),
//                     // Text(snapshot.data.get('details').toString() ?? ''),
//                   ],
//                 );
//               },
//             ),

//           ),

//

          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       Container(
          //         height: 100,
          //         width: 100,
          //         color: Colors.red,
          //       ),
          //       Container(
          //         height: 100,
          //         width: 100,
          //         color: Colors.green,
          //       ),
          //       Container(
          //         height: 100,
          //         width: 100,
          //         color: Colors.black,
          //       ),
          //       Container(
          //         height: 100,
          //         width: 100,
          //         color: Colors.yellow,
          //       ),
          //       Container(
          //         height: 100,
          //         width: 100,
          //         color: Colors.purple,
          //       ),
          //     ],
          //   ),
          // ),

          // Text(
          //   "hello world ",
          //   style: TextStyle(
          //     color: Colors.brown,
          //     fontSize: 20,
          //   ),
          // )

//
        ],
      ),

      //

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var box = await Hive.openBox("Moheed");
          var box2 = await Hive.openBox('name');

          box2.put('Youtube', 'TechBrothers');
          box2.put('details', {
            'role': 'developer',
            'shift': 'morning',
          });
          box.put('age', '25');
          box.put('name', 'Moheed Aziz');

          print(box.get('name'));
          print(box.get('age'));
          print(box2.get('details'));
          print(box2.get('details')['role']);
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}
//
//
// ehre  roq  nhf  j b h   dwjw  g23  d484  fu383  ak66623 hu   
// dwe   bb bhs 3992      w3 j  fg   ywt  wnnne  3rrhjuf uuru  i3498r  uruf4 w8885b iw

// jrf8f47b ryb rr399n     8884  rhf   sooo rrru 
// h rju4         jjj knkknfn   u ut4e bhf  s88874h   shhb  eig zfnE4 wn"n 3    e
// joe 4775 w83843y uehf  sy4br3 hdsohh  hhhhb ewrr yrnn sdt  iw w4y875b  srhb fj rj  rf


//