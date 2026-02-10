import 'package:get_it/get_it.dart' show GetIt;
import 'package:hexawave/injection.config.dart';
import 'package:injectable/injectable.dart';


final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies(){
  getIt.init();
}