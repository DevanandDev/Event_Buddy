import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_buddy/models/book_event_model.dart';
import 'package:logger/logger.dart';


class BookingEventService {
  
  FirebaseFirestore store = FirebaseFirestore.instance;
 final Logger logger = Logger();

  Future<void> bookService(BookingEventModel booked)async{
    try {
      await store.collection('Booking').add(booked.toFire());
      logger.i('Booking added successfully');
    } catch (e) {
     logger.e('Booking failed') ;
    }
  }
}