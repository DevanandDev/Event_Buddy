import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_buddy/models/event_model.dart';

class FetchEventsService {
  
  final FirebaseFirestore firestore =  FirebaseFirestore.instance;

  Future<List<EventModel>> fetchData()async{
    try {
      final snapshot = await firestore.collection('events').get();
      log('snapshot data get');
      return snapshot.docs.map((doc){
        return EventModel.fromJson(doc.data());
      }).toList();
    } catch (e) {
     print('Error fetching events: $e');
      return [
        
      ];
    }
  }
}