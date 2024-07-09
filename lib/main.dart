import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadhil/core/bloc_observer.dart';
import 'package:tadhil/core/network/dio_helper.dart';
import 'package:tadhil/features/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  runApp(const Tafsil());
}

class Tafsil extends StatelessWidget {
  const Tafsil({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
