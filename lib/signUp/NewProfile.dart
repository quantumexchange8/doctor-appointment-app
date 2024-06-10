import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/widgets/BottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';




class NewProfile extends StatefulWidget {
  const NewProfile({super.key});

  @override
  State<NewProfile> createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  TextEditingController dateOfBirthController = TextEditingController();
  
  String? selectedGender = 'Gender';
  List<String> genderList = ['Gender','Female','Male'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fill Your Profile',style: h1),
      ),

      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [

          Stack(
            children: [
              ClipOval(
                child: Image.asset('assets/image/profile-circle.png',
                fit: BoxFit.cover,
                width: 180,
                height: 180,
                ),
              ),
              Positioned(
                bottom: 23, right: 23,
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Iconsax.message_edit5, color: primaryGrey.shade900, size: 30.0)),
              ),
            ],
          ),
        
          const SizedBox(height: 20.0),

          TextField(
            decoration: InputDecoration(
              hintText: 'Michael Jordan', hintStyle: bodySregular,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: primaryGrey.shade300),
            ),
            filled: true,
            fillColor: primaryGrey.shade100,
            contentPadding: EdgeInsets.all(12.0),
            ),
          ),

          const SizedBox(height: 15.0),

          TextField(
            decoration: InputDecoration(
              hintText: 'Nickname', hintStyle: bodySregular,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: primaryGrey.shade300),
            ),
            filled: true,
            fillColor: primaryGrey.shade100,
            contentPadding: EdgeInsets.all(12.0),
            ),
          ),

          const SizedBox(height: 15.0),

          TextField(
            
            decoration: InputDecoration(
              hintText: 'name@example.com', hintStyle: bodySregular,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: primaryGrey.shade300),
            ),
            filled: true,
            fillColor: primaryGrey.shade100,
            contentPadding: EdgeInsets.all(12.0),
            ),
          ),

          const SizedBox(height: 15.0),
          
          TextField(
            controller: dateOfBirthController,
            decoration: InputDecoration(
              prefixIcon: GestureDetector(
                onTap: () async {
                 final DateTime? selectedDate = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900), 
                  lastDate: DateTime(2050)
                );
                if(selectedDate != null){
                  final newDate = DateFormat('dd-MM-yyyy').format(selectedDate);
                  setState(() {
                    dateOfBirthController.text = newDate;
                  });
                }
                },
                child: Icon(Iconsax.calendar_2, color: primaryGrey.shade400)
                ),
              hintText: 'Date of Birth', hintStyle: bodySregular,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: primaryGrey.shade300),
            ),
            filled: true,
            fillColor: primaryGrey.shade100,
            contentPadding: EdgeInsets.all(12.0),
            ),
          ),

          const SizedBox(height: 15.0),

          //Gender dropdown menu

          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(width: 1.0, color: primaryGrey.shade300),
              ),
              filled: true,
              fillColor: primaryGrey.shade100,
              contentPadding: EdgeInsets.all(12.0),
              //suffixIcon: Icon(Iconsax.arrow_down),
            ),
            value: selectedGender,
            items: genderList
                .map((gender)=>DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender, style: bodySregular),
                    ),
              ).toList(),
            
           onChanged: (gender){
            if(gender!=null){
              setState(() => selectedGender = gender);
            }
           },
          ),

          const SizedBox(height: 20.0),

          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: (){ 
                    showDialog<String>(
                    context: context,
                    builder: (context) => AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      content: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.5, 
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              
                              Image.asset('assets/image/tick_profile.png'),
                              const SizedBox(height: 30.0),
                              Text('Congratulations!',style: h3,textAlign: TextAlign.center),
                              const SizedBox(height: 10.0),
                              Text('Your account is ready to use. You will be redirected to the Home Page in a few seconds...',
                              style: bodySmedium,textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20.0),
                              Container(
                                width: 70.0, // Adjust the width as needed
                                height: 70.0, // Adjust the height as needed
                                child: LoadingIndicator(
                                  indicatorType: Indicator.ballSpinFadeLoader,
                                  colors: [primaryGrey],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      
                    ), 
                  ); 
                  Future.delayed( Duration(seconds: 2), () {
                      // Navigate to the home page
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (context)=>BottomNavBar()
                        ),
                      );
                    });
                  },
                  child: Text('Save'),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(45.0)),
                    backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade900),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    )),
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