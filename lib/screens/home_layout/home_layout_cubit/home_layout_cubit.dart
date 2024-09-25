import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/core/cache_data.dart';

import 'home_layout_states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitialState());

  // The first time the app will be lounch it will be light
  /*
        Is Dark the default value is false
        cause the cashed variable = null
   */
  bool isDark = SharedData.getData(key: AppStrings.appTheme) ?? false;

  void changeThemeMode() {
    isDark = !isDark;
    SharedData.saveData(key: AppStrings.appTheme, value: isDark);
    emit(ChangeThemeModeState());
  }

  int currentIndex = 0;

  void changeNavBar({required int index}) {
    currentIndex = index;
    emit(ChangeNavbarState());
  }
}
