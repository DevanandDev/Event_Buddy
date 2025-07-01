
import 'package:event_buddy/models/event_model.dart';
import 'package:event_buddy/services/fetch_events.dart';
import 'package:flutter/material.dart';

class EventFetchProvider extends ChangeNotifier{
   FetchEventsService service = FetchEventsService();
   List<EventModel> eventDatas =[];

   bool isloading = false;

   void fetchProvider()async{
    isloading = true;
    notifyListeners();
    try {
      eventDatas= await service.fetchData();
    } catch (e) {
      throw Exception(e.toString());
    }
    finally{
      isloading=false;
      notifyListeners();
    }
   }
}