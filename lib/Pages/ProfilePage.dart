import 'package:doctor_appointment_app/Pages/FavouritePage.dart';
import 'package:doctor_appointment_app/Pages/NotificationPage.dart';
import 'package:doctor_appointment_app/SignIn/SignInPage.dart';
import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/widgets/ProfileMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: h1),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),

      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: ClipOval(
                      child: Image.asset('assets/image/profile_picture.png',
                      fit: BoxFit.cover,
                      width: 180,
                      height: 180,
                      ),
              ),
                  ),
                  Positioned(
                    bottom: 17,
                    right: 105,
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/icon/message-edit.png')
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
          
              //name and phone number
              Text('Daniel Martinez', style: h3),
              const SizedBox(height: 5),
              Text('+123 856479683', style: bodySregular),
              const SizedBox(height: 5),
          
              ProfileMenu(
                icon: Iconsax.user_edit, 
                title: 'Edit Profile', 
                onPress: (){},
              ),
              Divider(thickness: 1,color: primaryGrey.shade300,height: 2),
              ProfileMenu(
                icon: Iconsax.heart, 
                title: 'Favourite', 
                onPress: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=> FavouritePage()),
                  );
                },
              ),
              Divider(thickness: 1,color: primaryGrey.shade300,height: 2),
              ProfileMenu(
                icon: Iconsax.notification, 
                title: 'Notifications', 
                onPress: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=> NotificationPage()),
                  );
                },
              ),
              Divider(thickness: 1,color: primaryGrey.shade300,height: 2),
              ProfileMenu(
                icon: Iconsax.setting_24, 
                title: 'Settings', 
                onPress: (){},
              ),
              Divider(thickness: 1,color: primaryGrey.shade300,height: 2),
              ProfileMenu(
                icon: Iconsax.message_question, 
                title: 'Help and Support', 
                onPress: (){},
              ),
              Divider(thickness: 1,color: primaryGrey.shade300,height: 2),
              ProfileMenu(
                icon: Iconsax.security_safe, 
                title: 'Terms and Conditions', 
                onPress: (){},
              ),
              Divider(thickness: 1,color: primaryGrey.shade300,height: 2),

              GestureDetector(
                onTap: (){
                  showModalBottomSheet<void>(
                    context: context, 
                    builder: (BuildContext context){
                    return SizedBox(
                      height: 175,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Logout',style: h2),
                            Divider(thickness: 1, color: primaryGrey.shade300, height:20.0),
                            Text('Are you sure you want to log out?', style: bodySregular),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                        
                                SizedBox(
                                  height: 45.0, width: 155.0,
                                  child: FilledButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    }, 
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade400),
                                    ),
                                    child: Text('Cancel', style: bodySbold),
                                  ),
                                ),
                        
                                SizedBox(
                                  height: 45.0, width: 155.0,
                                  child: FilledButton(
                                    
                                    onPressed: (){
                                      Navigator.pushReplacement(
                                        context, 
                                        MaterialPageRoute(
                                          builder: (context)=> SignInPage()),
                                      );
                                    }, 
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade900),
                                    ),
                                    child: Text('Yes, Logout', style: bodySboldWhite),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                    );
                    }
                  );
                  
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Iconsax.logout, color: primaryGrey.shade700),
                      const SizedBox(width: 16),
                      Text('Log Out', style: bodyXL,)
                    ],
                  ),
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}