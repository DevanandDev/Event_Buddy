import 'dart:developer';

import 'package:event_buddy/models/event_model.dart';
import 'package:event_buddy/services/fetch_events.dart';
import 'package:flutter/material.dart';

class EventFetchProvider extends ChangeNotifier {
  FetchEventsService service = FetchEventsService();
  List<EventModel> eventDatas = [];
  List<EventModel> filterEvent = [];

  bool isloading = false;

  void fetchProvider() async {
    isloading = true;
    notifyListeners();
    try {
      eventDatas = await service.fetchData();
      filterEvent = eventDatas;
      log('fetched');
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  void search(String data) {
    if (data.isEmpty) {
      filterEvent = eventDatas;
    } else {
      filterEvent =
          eventDatas
              .where(
                (event) =>
                    event.name.toLowerCase().contains(data.toLowerCase()),
              )
              .toList();
    }
    notifyListeners();
  }
}
