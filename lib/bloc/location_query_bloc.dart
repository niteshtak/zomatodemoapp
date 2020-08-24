import 'dart:async';

import 'package:zomatodemoapp/bloc/bloc.dart';
import 'package:zomatodemoapp/models/location.dart';
import 'package:zomatodemoapp/networking/api_client.dart';

class LocationQueryBloc implements Bloc {
  final _controller = StreamController<List<Location>>();
  final _client = ZomatoClient();
  Stream<List<Location>> get locationStream => _controller.stream;

  void submitQuery(String query) async {
    // 1
    final results = await _client.fetchLocations(query);
    if (!_controller.isClosed) {
      _controller.sink.add(results);
    }
    
  }

  @override
  void dispose() {
    _controller.close();
  }
}
