import 'package:flutter/foundation.dart';

class BookingEventModel {
  String? name;
  String? email;
  String? mobile;
  String? location;
  String? address;
  String? date;
  String? eventType;

  BookingEventModel({
    required this.name,
    required this.email,
    required this.mobile,
    required this.location,
    required this.address,
    required this.date,
    required this.eventType,
  });

  Map<String,dynamic> toFire(){
    return{
     'name':name,
     'email':email,
     'mobile':mobile,
     'location':location,
     'address':address,
     'date':date,
     'type':eventType
    };
  }
}
