import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/forgotPassword/EmailForgotPassword.dart';
import 'package:doctor_appointment_app/signUp/SignUp.dart';
import 'package:doctor_appointment_app/widgets/BottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0, bottom: 22.0),
                      child: Image.asset('assets/logo/Logo_black.png',alignment: Alignment.center,),
                    ),
                  ],
                ),
                Text('Hi, Welcome Back!',style: h2),
                const SizedBox(height: 5.0),
                Text('Hope you\'re doing fine.',style: bodySregular),
                const SizedBox(height: 25.0),

                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.sms,size: 20.0,color: primaryGrey.shade400,),
                    hintText: 'Your Email',hintStyle: bodySregular,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryGrey.shade300),
                      borderRadius: BorderRadius.circular(10.0),
                      ),
                      isDense: true,
                      filled: true,
                      fillColor: primaryGrey.shade50,
                      contentPadding: EdgeInsets.all(12.0),
                  ),
                ),

                const SizedBox(height: 15.0),

                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.lock,size: 20.0,color: primaryGrey.shade400,),
                    hintText: 'Password',hintStyle: bodySregular,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryGrey.shade300),
                      borderRadius: BorderRadius.circular(10.0),
                      ),
                      isDense: true,
                      filled: true,
                      fillColor: primaryGrey.shade50,
                      contentPadding: EdgeInsets.all(12.0),
                  ),
                ),

                const SizedBox(height: 15.0),

                Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=> BottomNavBar(),
                                  ));
                              }, 
                              child: Text('Sign In'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(primaryGrey.shade900),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0),),
                                  ),
                                fixedSize: MaterialStateProperty.all<Size>(
                                Size.fromHeight(45.0),
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),

                  const SizedBox(height: 15.0),

                  Row(
                    children: [
                      Expanded(child: Divider(color: primaryGrey.shade300),),
                      Text('    or    '),
                      Expanded(child: Divider(color: primaryGrey.shade300),),
                  ],),
                
                const SizedBox(height: 15.0),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: (){}, 
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), 
                            ),
                             
                          ),
                          fixedSize: MaterialStateProperty.all<Size>(
                                Size.fromHeight(45.0),
                          ),
                          
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(color: primaryGrey.shade300),
                          ),
                           
                           
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icon/Google_icon.png', height: 20,),
                            const SizedBox(width: 8),
                            Text('Sign In with Google',
                            textAlign: TextAlign.center,
                            style: bodySmedium,
                            ),
                          ],
                        ),
                        ),
                    ),
                  ],
                ),

                const SizedBox(height: 5.0),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: (){}, 
                        style: ButtonStyle(
                        
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            ),
                            ),
                          fixedSize: MaterialStateProperty.all<Size>(
                                Size.fromHeight(45.0),
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(color: primaryGrey.shade300)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icon/Facebook_icon.png', height: 20,),
                            const SizedBox(width: 8),
                            Text('Sign In with Facebook',
                            textAlign: TextAlign.center,
                            style: bodySmedium,
                            ),
                          ],
                        ),
                        ),
                    ),
                  ],
                ),

                const SizedBox(height: 10.0),

                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=> EmailForgotPassword(),),
                    );
                  }, 
                  child: const Text('Forgot password?',
                  style: TextStyle(color: Color(0xff1c64f2)),),
                ),

                //const SizedBox(height: 5.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account yet?', style: bodySregular),
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context)=>SignUpPage(),
                          ),
                        );
                      }, 
                      child: const Text('Sign Up', style: TextStyle(color: Color(0xff1c64f2)),),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}