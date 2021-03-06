import 'package:flutter_wanandroid_redux/redux/reducer/collection_reducer.dart';
import 'package:flutter_wanandroid_redux/redux/reducer/home_reducer.dart';
import 'package:flutter_wanandroid_redux/redux/reducer/login_reducer.dart';
import 'package:flutter_wanandroid_redux/redux/reducer/navigation_reducer.dart';
import 'package:flutter_wanandroid_redux/redux/reducer/project_reducer.dart';
import 'package:flutter_wanandroid_redux/redux/reducer/public_account_reducer.dart';
import 'package:flutter_wanandroid_redux/redux/reducer/register_reducer.dart';
import 'package:flutter_wanandroid_redux/redux/reducer/search_action_reducer.dart';
import 'package:flutter_wanandroid_redux/redux/reducer/search_result_reducer.dart';
import 'package:flutter_wanandroid_redux/redux/reducer/welfare_reducer.dart';
import 'package:flutter_wanandroid_redux/redux/state/app_state.dart';

AppState appReducer(AppState appState, dynamic action) {
  return AppState(
      loginState: loginReducer(appState.loginState, action),
      registerState: registerReducer(appState.registerState, action),
      homeState: homeReducer(appState.homeState, action),
      projectState: projectReducer(appState.projectState, action),
      searchActionState:
          searchActionReducer(appState.searchActionState, action),
      searchResultSate: searchResultReducer(appState.searchResultSate, action),
      welfareState: welfareReducer(appState.welfareState, action),
      navigationState: navigationReducer(appState.navigationState, action),
      publicAccountState:
          publicAccountReducer(appState.publicAccountState, action),
      collectionState: collectionReducer(appState.collectionState, action));
}
