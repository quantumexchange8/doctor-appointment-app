import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/forgotPassword/CodeForgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EmailForgotPassword extends StatefulWidget {
  const EmailForgotPassword({super.key});

  @override
  State<EmailForgotPassword> createState() => _EmailForgotPasswordState();
}

class _EmailForgotPasswordState extends State<EmailForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.asset('assets/logo/Logo_black.png'),
          const SizedBox(height: 25.0),
          Text('Forgot Password?', style: h2),
          const SizedBox(height: 5.0),
          Text('Enter your Email, we will send you a verification code.', style: bodySregular, textAlign: TextAlign.center,),
          const SizedBox(height: 25.0),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.sms, size: 20.0, color: primaryGrey.shade400),
              hintText: 'Your Email', hintStyle: bodySregular,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: primaryGrey.shade400),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: primaryGrey.shade50,
            contentPadding: EdgeInsets.all(12.0),
            ),
          ),
          const SizedBox(height: 30.0),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)=> CodeForgotPassword()),
                    );
                  }, 
                  child: Text('Send Code'),
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
        
          ],
        ),
      ),
    );
  }
}