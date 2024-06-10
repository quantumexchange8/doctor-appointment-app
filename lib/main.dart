import 'package:doctor_appointment_app/controllers/favourite_provider.dart';
import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/onBoarding/OnBoardingMainPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
   runApp(
    ChangeNotifierProvider(
      create: (context) => FavouriteProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Appointment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: primaryGrey),
        useMaterial3: true,
      ),
      home: OnBoardingMainPage(),
    );
  }
}

