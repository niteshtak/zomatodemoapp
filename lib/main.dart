import 'package:flutter/material.dart';
import 'package:zomatodemoapp/bloc/bloc_provider.dart';
import 'package:zomatodemoapp/bloc/favourtite_bloc.dart';
import 'package:zomatodemoapp/bloc/location_bloc.dart';
import 'package:zomatodemoapp/widgets/main_page.dart';

void main() => runApp(ZomatoApp());

class ZomatoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationBloc>(
      bloc: LocationBloc(),
      child: BlocProvider<FavoriteBloc>(
        bloc: FavoriteBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Restaurant Finder',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: MainPage(),
        ),
    )
    );
  }
}