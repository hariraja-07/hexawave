import 'package:flutter/material.dart';
import 'package:hexawave/app.dart';
import 'package:hexawave/features/recents/data/models/recent_item.dart';
import 'package:hexawave/injection.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Hive.registerAdapter(RecentItemAdapter());
  Hive.registerAdapter(RecentTypeAdapter());
  await Hive.openBox<RecentItem>('recents');

  configureDependencies();

  runApp(HexaWaveApp());
}