import 'package:flutter/material.dart';
import 'package:hexawave/app.dart';
import 'package:hexawave/injection.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<String>('recents');
  configureDependencies();

  runApp(HexaWaveApp());
}