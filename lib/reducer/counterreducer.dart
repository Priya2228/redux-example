import 'package:flutter_application_1/Actions/decrementaction.dart';
import 'package:flutter_application_1/Actions/incrementaction.dart';
import 'package:flutter_application_1/appstate/appstate.dart';

AppState counterReducer(AppState state, dynamic action) {
  if (action is IncrementAction) {
    return AppState(state.counter + 1);
  } else if (action is DecrementAction) {
    return AppState(state.counter - 1);
  }
  return state;
}
