import 'package:flutter/material.dart';
import 'package:hexawave/app.dart';
import 'package:hexawave/features/recents/data/models/recent_item.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(RecentItemAdapter());

  runApp(HexaWaveApp());
}