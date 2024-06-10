import 'package:doctor_appointment_app/SignIn/SignInPage.dart';
import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
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
            Text('Create new password', style: h2),
            const SizedBox(height: 5.0),
            Text('Your new password must be different from previously used password.', style: bodySregular, textAlign: TextAlign.center,),
            const SizedBox(height: 25.0),

            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.lock, size: 20.0, color: primaryGrey.shade400,),
                hintText: 'Password', hintStyle: bodySregular,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: primaryGrey.shade400),
                borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: primaryGrey.shade50,
            contentPadding: EdgeInsets.all(12.0),
              ),
            ),

            const SizedBox(height: 15.0),

            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.lock, size: 20.0, color: primaryGrey.shade400),
                hintText: 'Confirm Password', hintStyle: bodySregular,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: primaryGrey.shade400),
              ),
              filled: true,
              fillColor: primaryGrey.shade50,
              contentPadding: EdgeInsets.all(12.0),
              ),
            ),

            const SizedBox(height: 25.0),

            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: (){
                      showDialog(
                        context: context, 
                        builder: ((context) => AlertDialog(
                          content: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height *0.4),
                          child: Column(
                            children: [
                              Image.asset('assets/image/tick_profile.png'),
                              const SizedBox(height: 30.0),
                              Text('Your password has been reset',style: h3,textAlign: TextAlign.center),
                              const SizedBox(height: 10.0),
                              Text('You will be redirected to the Sign In Page. Click Continue to proceed.',
                              style: bodySmedium,textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20.0),
                              FilledButton(
                                onPressed: (){
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(
                                      builder: (context)=> SignInPage()),
                                  );
                                }, 
                                child: Text('Continue'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade900),
                                  fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(45.0)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
                                ),
                              ),
                              

                            ],
                          ),
                          ),
                        )
                        ),
                      );//showDialog
                    }, 
                    child: Text('Reset Password'),
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