import 'package:flutter/material.dart';
import 'package:flutter_application_1/Actions/decrementaction.dart';
import 'package:flutter_application_1/Actions/incrementaction.dart';
import 'package:flutter_application_1/appstate/appstate.dart';
import 'package:flutter_application_1/reducer/counterreducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    counterReducer,
    initialState: AppState.initialState(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Redux Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You have pushed the button this many times:"),
            StoreConnector<AppState, String>(
              converter: (store) => store.state.counter.toString(),
              builder: (context, counter) => Text(
                counter,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StoreConnector<AppState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(IncrementAction());
            },
            builder: (context, callback) => FloatingActionButton(
              onPressed: callback,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
          SizedBox(height: 10),
          StoreConnector<AppState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(DecrementAction());
            },
            builder: (context, callback) => FloatingActionButton(
              onPressed: callback,
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
