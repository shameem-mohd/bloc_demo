import 'package:bloc_demo/Bloc/catogery_bloc.dart';
import 'package:bloc_demo/MainPage.dart';
import 'package:bloc_demo/PlayerDetails.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(MultiBlocProvider (
    providers:[BlocProvider(create:(BuildContext context)=>CatogeryBloc()),],
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
