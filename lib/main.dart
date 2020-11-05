import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctesting/bloc/starships_bloc.dart';
import 'package:flutterbloctesting/service/swapi.dart';
import 'package:flutterbloctesting/view/starship.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Test Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (_) => StarshipsBloc(SwapiService(Dio())),
        child: StarshipView(),
      ),
    );
  }
}
