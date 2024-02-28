import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/navigation/navigation_tabs.dart';

final class NavigationCubit extends Cubit<NavigationTab> {
  NavigationCubit(NavigationTab tab) : super(tab);

  void setActiveTab(NavigationTab? tab) async {
    if (tab != null) emit(tab);
  }
}
