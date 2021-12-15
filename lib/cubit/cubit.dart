import 'package:bmi/cubit/states.dart';
import 'package:bmi/shared/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeLightTheme({bool? fromShared}) async {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ThemeToggleState());
    } else {
      isDark = !isDark;
      await CacheHelper.sharedPreferences!.setBool('isDark', isDark);
      emit(ThemeToggleState());
    }

    print(isDark);
  }
}
