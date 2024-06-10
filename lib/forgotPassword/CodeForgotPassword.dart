import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/forgotPassword/EditPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeForgotPassword extends StatefulWidget {
  const CodeForgotPassword({super.key});

  @override
  State<CodeForgotPassword> createState() => _CodeForgotPasswordState();
}

class _CodeForgotPasswordState extends State<CodeForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          
            children: [
              Image.asset('assets/logo/Logo_black.png'),
              const SizedBox(height: 25.0),
              Text('Verify Code', style: h2),
              const SizedBox(height: 5.0),
              Text('Enter the code we just sent you on your registered Email', style: bodySregular, textAlign: TextAlign.center,),
              const SizedBox(height: 25.0),

              PinCodeTextField(
                appContext: context, 
                length: 5,
                enableActiveFill: true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  fieldHeight: 60.0,
                  fieldWidth: 60.0,
                  activeColor: primaryGrey.shade300,
                  inactiveColor: primaryGrey.shade300,
                  selectedColor: primaryGrey.shade900,
                  borderRadius: BorderRadius.circular(13.0),
                  borderWidth: 1,
                  selectedFillColor: Colors.transparent,
                  inactiveFillColor: primaryGrey.shade200,
                  activeFillColor: primaryGrey.shade200,
                ),
              ),

              const SizedBox(height: 15.0),

              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>EditPassword()),
                        );
                      }, 
                      child: Text('Verify'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade900),
                        fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(45.0)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Didn\'t get the Code?',style: bodySregular),
                  
                  TextButton(
                    onPressed: (){}, 
                    child: Text('Resend', style: TextStyle(color: Color(0xff1c64f2)),),
                  ),
                ],
              ),

              
            ],
          
        ),
      ),

    );
  }
}