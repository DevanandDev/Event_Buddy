import 'package:event_buddy/firebase_options.dart';
import 'package:event_buddy/view/splash_screen.dart';
import 'package:event_buddy/viewmodel/auth_provider.dart';
import 'package:event_buddy/viewmodel/booking_provider.dart';
import 'package:event_buddy/viewmodel/carousel_provider.dart';
import 'package:event_buddy/viewmodel/dropdown_provider.dart';
import 'package:event_buddy/viewmodel/event_fetch_provider.dart';
import 'package:event_buddy/viewmodel/location_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(providers: [
     ChangeNotifierProvider(create: (context) => AuthProvider()),
     ChangeNotifierProvider(create: (context) => EventFetchProvider(),),
     ChangeNotifierProvider(create: (context) => CarouselProvider(),),
     ChangeNotifierProvider(create: (context) => DropdownProvider(),),
     ChangeNotifierProvider(create: (context) => LocationProvider(),),
     ChangeNotifierProvider(create: (context) => BookingProvider(),)
    ],

       child: MyApp()),
    );
    
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
