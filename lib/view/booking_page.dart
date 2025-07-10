import 'package:event_buddy/constants/color_const.dart';
import 'package:event_buddy/constants/dropdown_list.dart';
import 'package:event_buddy/constants/text_constants.dart';
import 'package:event_buddy/models/fetch_event_model.dart';
import 'package:event_buddy/services/booking_event.dart';
import 'package:event_buddy/viewmodel/location_provider.dart';
import 'package:event_buddy/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyBooking extends StatelessWidget {
  MyBooking({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController adddressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController eTypeController = TextEditingController();

  List<String> listEvents = DropdownList.eventType;

  @override
  Widget build(BuildContext context) {
    final location = Provider.of<LocationProvider>(context, listen: false);
    if (location.currentAddress != null) {
      locationController.text = location.currentAddress ?? '';
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: text(
          text: 'Book Your Event',
          fontSize: 20,
          fontweights: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 240),
              child: text(text: 'Personal Details'),
            ),
            SizedBox(height: 20),
            textForm(
              acontroller: nameController,
              prefix: Icon(Icons.person, color: ColorConsts.purple),
              hText: TextConstants.fullname,
            ),
            SizedBox(height: 10),
            textForm(
              acontroller: emailController,
              prefix: Icon(Icons.email, color: ColorConsts.purple),
              hText: TextConstants.email,
            ),
            SizedBox(height: 10),
            textForm(
              acontroller: phoneController,
              prefix: Icon(Icons.phone, color: ColorConsts.purple),
              hText: TextConstants.mobile,
            ),
            SizedBox(height: 10),
            Consumer<LocationProvider>(
              builder: (context, value, child) {
                return textForm(
                  acontroller: locationController,
                  prefix: Icon(Icons.location_on, color: ColorConsts.purple),
                  hText: TextConstants.location,
                  ontap: () async {
                    await value.fetchLocation();
                    locationController.text = value.currentAddress ?? '';
                  },
                );
              },
            ),
            SizedBox(height: 10),
            textForm(
              acontroller: adddressController,
              prefix: Padding(
                padding: const EdgeInsets.only(bottom: 45),
                child: Icon(Icons.house, color: ColorConsts.purple),
              ),
              hText: TextConstants.address,
              maxlines: 3,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 260),
              child: text(text: 'Event Details'),
            ),
            SizedBox(height: 20),
            textForm(
              acontroller: dateController,
              prefix: Icon(
                Icons.calendar_month_outlined,
                color: ColorConsts.purple,
              ),
              hText: TextConstants.calender,
              ontap: () async {
                DateTime? pickdate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (pickdate != null) {
                  String formatedDate = DateFormat(
                    'dd/MMM/yyyy',
                  ).format(pickdate);
                  dateController.text = formatedDate;
                }
              },
            ),
            SizedBox(height: 10),
            textForm(
              hText: 'Event Type',
              acontroller: eTypeController,
              prefix: Icon(
                Icons.event_available_sharp,
                color: ColorConsts.purple,
              ),
            ),
            SizedBox(height: 20),
            eButton(
              text: 'Book Event',
              presse: (){
                final bookEvents = BookingEventModel(
                  name: nameController.text.trim(),
                  email: emailController.text.trim(),
                  mobile: phoneController.text.trim(),
                  location: locationController.text.trim(),
                  address: adddressController.text.trim(),
                  date: dateController.text.trim(),
                  eventType: eTypeController.text.trim(),
                );

                BookingEventService().bookService(bookEvents);
              },
            ),
          ],
        ),
      ),
    );
  }
}
