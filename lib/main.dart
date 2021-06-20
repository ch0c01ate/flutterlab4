import 'package:blocdemo/blocs/counter_library_bloc.dart';
import 'package:blocdemo/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterLibraryBloc>(
        create: (context) => CounterLibraryBloc(),
        child: CounterPage(title: 'Flutter Demo with BLoC'),
      ),
    );
  }
}
