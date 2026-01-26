import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexawave/features/player/logic/player_cubit.dart';
import 'package:hexawave/routes/app_router.dart';

class HexaWaveApp extends StatelessWidget{
  const HexaWaveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> PlayerCubit(),
      child: MaterialApp.router(
        title: 'HexaWave',
        routerConfig: appRouter,
      ),
    );
  }
}