import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import 'package:practice_flutter/features/notes/presentation/pages/notes_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("notes");

  runApp(
      MaterialApp(
        home: NotesPage(),
      )
  );
}
