import 'dart:async';

import 'package:zomatodemoapp/bloc/bloc.dart';
import 'package:zomatodemoapp/models/location.dart';
import 'package:zomatodemoapp/models/restaurant.dart';
import 'package:zomatodemoapp/networking/api_client.dart';

class RestaurantBloc implements Bloc {
  final Location location;
  final _client = ZomatoClient();
  final _controller = StreamController<List<Restaurant>>();

  Stream<List<Restaurant>> get stream => _controller.stream;
  RestaurantBloc(this.location);

  void submitQuery(String query) async {
    final results = await _client.fetchRestaurants(location, query);
    if (!_controller.isClosed) {
      _controller.sink.add(results);
    }
    
  }

  @override
  void dispose() {
    _controller.close();
  }
}