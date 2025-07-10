import 'package:event_buddy/models/book_event_model.dart';
import 'package:event_buddy/services/booking_event.dart';
import 'package:event_buddy/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class BookingProvider extends ChangeNotifier {
  BookingEventService service = BookingEventService();
  bool isLoading = false;

  Future<bool> bookData(BuildContext context, BookingEventModel book) async {
    isLoading = true;
    notifyListeners();
    try {
      await service.bookService(book);
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: text(text: 'Server error and try again : $e')),
      );
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
