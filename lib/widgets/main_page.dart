import 'package:flutter/material.dart';
import 'package:zomatodemoapp/bloc/bloc_provider.dart';
import 'package:zomatodemoapp/bloc/location_bloc.dart';
import 'package:zomatodemoapp/models/location.dart';
import 'package:zomatodemoapp/widgets/location_page.dart';
import 'package:zomatodemoapp/widgets/restaurant_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Location>(
      stream: BlocProvider.of<LocationBloc>(context).locationStream,
      builder: (context, snapshot) {
        final location = snapshot.data;

        if (location == null) {
          return LocationPage();
        }

        return RestaurantScreen(location: location);
      }
    );
  }
}