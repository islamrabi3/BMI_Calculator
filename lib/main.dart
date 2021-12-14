import 'package:bmi/bmi_screen.dart';
import 'package:bmi/constance/const.dart';
import 'package:bmi/cubit/cubit.dart';
import 'package:bmi/cubit/states.dart';
import 'package:bmi/shared/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'bloc_observer/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  bool darkModeCache = CacheHelper.sharedPreferences!.getBool('isDark')!;
  print(' cache value is  $darkModeCache');
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(darkModeCache));
}

class MyApp extends StatelessWidget {
  bool? isDark;

  MyApp(this.isDark);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..changeLightTheme(fromShared: isDark),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: darkThemeData,
            theme: lightthemeData,
            home: BmiScreen(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
