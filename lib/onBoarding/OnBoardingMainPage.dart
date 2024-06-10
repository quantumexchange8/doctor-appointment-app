import 'package:doctor_appointment_app/onBoarding/BoardingOne.dart';
import 'package:flutter/material.dart';

class OnBoardingMainPage extends StatefulWidget {
  
  const OnBoardingMainPage({super.key});

  @override
  State<OnBoardingMainPage> createState() => _OnBoardingMainPageState();
}

class _OnBoardingMainPageState extends State<OnBoardingMainPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push( 
          context,
          MaterialPageRoute(
          builder: (context) => BoardingOne()
          ),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/splashScreen.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
             const Expanded(child: SizedBox(width: double.infinity)),
             Image.asset('assets/logo/healthLogo.png',height: 150, width: 150),
             const Expanded(child: SizedBox()),
            ],
          ),
        ),
       
        
      ),
    );
  }
}