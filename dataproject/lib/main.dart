import 'package:dataproject/FreeUser/FreeUser.dart';
import 'package:dataproject/HomeScreen.dart';
import 'package:dataproject/Notes/Model/Freeuser.dart';
import 'package:dataproject/NotesHive/HomeScree.dart';
import 'package:dataproject/NotesHive/Model/notes_model.dart';
import 'package:dataproject/Pagenation/Pagenation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>('notes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home:
            // PagenationScreen()
            HomeScreen1()
        // Home()
        ///PagenationScreen()
        // HomeScreen(),
        );
  }
}
