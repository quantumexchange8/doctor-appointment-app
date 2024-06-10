import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/signUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class BoardingThree extends StatefulWidget {
  const BoardingThree({super.key});

  @override
  State<BoardingThree> createState() => _BoardingThreeState();
}

class _BoardingThreeState extends State<BoardingThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          
        Expanded(
          flex:2,
          child: Image.asset('assets/image/doctor3.png',fit: BoxFit.cover),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Column(
              children: [
                Text('Thousands of Online Specialists', style: h2),
                const SizedBox(height:8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text('Explore a Vast Array of Online Medical Specialists, Offering an Extensive Range of Expertise Tailored to Your Healthcare Needs.', 
                        style: bodySregular, textAlign: TextAlign.center),
                ),
                //const SizedBox(height:8.0), 
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=> SignUpPage(),
                                  ));
                              }, 
                              child: Text('Next'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(primaryGrey.shade900),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                                  ),
                              ),
                            ),
                          ),
                    ],
                  ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 150.0),
                   child: StepProgressIndicator(
                    totalSteps: 3,
                    currentStep: 3,
                    size: 7.0,
                    padding: 1.0,
                    roundedEdges: Radius.circular(10),
                    customStep: (index, color, _) {
                    if (index == 2) {
                    // If it's the current step, return a larger sized box
                      return Container(
                        width: 1.0, 
                        height: 3.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15), 
                          color: primaryGrey.shade900,
                        ),
                      );
                    } else {
                      // For other steps, return a smaller sized dot
                      return Container(
                        width: 5.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryGrey.shade400,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 1),
                      );
                    }
                    },

                   
                   ),
                 ),
                 const SizedBox(height: 5.0,),
                 TextButton(
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=> SignUpPage(),
                      )
                    );
                  }, 
                  child: Text('Skip',style: bodySregular),
                  ),
                 
              ],
            ),
            
          ),
          
        ),
       

       
        
        
      
      ],),
    );
  }
}