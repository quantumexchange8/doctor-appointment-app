import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_appointment_app/Pages/NotificationPage.dart';
import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/controllers/favourite_provider.dart';
import 'package:doctor_appointment_app/controllers/homeSlider.dart';
import 'package:doctor_appointment_app/data/LocationInfo.dart';
import 'package:doctor_appointment_app/widgets/BottomNavBar.dart';
import 'package:doctor_appointment_app/widgets/SearchDoctors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController selectedDoctor = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeSliderController());   

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('Location',style: bodySregular),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=> BottomNavBar(initialIndex: 1)),
                    );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Iconsax.location5, color: primaryGrey.shade900, size: 20.0),
                        const SizedBox(width: 5),
                        Text('Seattle, USA', style: bodySbold),
                        const SizedBox(width: 5),
                        Icon(Iconsax.arrow_down_1, color: primaryGrey.shade900, size: 15.0),
                      ],
                    ),
                  ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15.0,top:15.0),
            child: IconButton(
              icon: Icon(Iconsax.notification_bing5, color: primaryGrey.shade600), 
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>NotificationPage()),
                );
              }, 
            ),
          ),
        ],
      ),
    
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=>SearchDoctor(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primaryGrey.shade100,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: primaryGrey.shade100),
              ),
                       
              child:Row(
                children: [
                  Icon(Iconsax.search_normal, color: primaryGrey.shade400),
                  const SizedBox(width: 10.0),
                  Text('Search doctor...' ,style: TextStyle(color: primaryGrey.shade400)),
                ],
              ), 
            ),
          ),          
          

          //Carousel Slider
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [

                CarouselSlider(
                  
                  items: [
                    _builderCardSlider(
                      'assets/image/home_doctor_1.png', 'Looking for \nSpecialist Doctors?', 'Schedule an appointment with\nour top doctors.'),
                
                    _builderCardSlider(
                      'assets/image/home_doctor_2.png', 'Online Meeting with \nDoctors?', 'Schedule an online meeting \nwith our specialist doctors \nfor convenient medical \nconsultations.'),

                    _builderCardSlider(
                      'assets/image/home_doctor_3.png', 'Thousands of Specialists', 'Explore our medical specialists \nthat could solve your health \nconcern.'),

                    //_builderCardSlider('assets/image/home_doctor_4.png', 'Holistic Care \nApproach', 'Our team of expert \ndoctors is dedicated to \nproviding personalized \ncare tailored to each \npatient\'s needs.'),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: const Image(
                              image: AssetImage('assets/image/home_doctor_4.png'),fit: BoxFit.contain),
                          ),
                          Positioned(
                            left: 215.5,
                            top: 15.0,
                            child: Text('Holistic Care \nApproach', style: h2white),
                          ),
                          Positioned(
                            left: 215.5,
                            top: 70.0,
                            child: Text('Our team of expert \ndoctors is dedicated to \nproviding personalized \ncare tailored to each \npatient\'s needs. ', style: bodyXSregularWhite),
                          ),
                        ],
                      ),
                    ),
                  ], 
                
                
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    viewportFraction: 1,
                    onPageChanged: (index, _) => controller.updatePageIndicator(index),
                  ),
                ),
              
                Obx(
                  ()=> Row(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children: [
                      for (int i = 0; i < 4; i++)
                      Container(
                        height: 5.0,
                        width: 15.0,
                        margin: EdgeInsets.only(right: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: controller.carousalCurrentIndex.value == i ? primaryGrey.shade900:primaryGrey.shade200,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
                      
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories',style: h3),
                  TextButton(
                    onPressed: (){}, 
                    child: Text('See All', style: bodySregular),
                  ),
                ],
              ),
                      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: _buildCategoryItem('assets/icon/home_dentistry.png', 'Dentistry')),
                 
                  GestureDetector(
                    onTap: (){},
                    child: _buildCategoryItem('assets/icon/home_cardio.png', 'Cardiology')),
                      
                  GestureDetector(
                    onTap: (){},
                    child: _buildCategoryItem('assets/icon/home_pulmo.png', 'Pulmonology')),
                      
                  GestureDetector(
                    onTap: (){},
                    child: _buildCategoryItem('assets/icon/home_general.png', 'General')),
                ],
              ),
                           
              const SizedBox(height: 10.0),
                      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: _buildCategoryItem('assets/icon/home_neuro.png', 'Neurology')),
                      
                  GestureDetector(
                    onTap: (){},
                    child: _buildCategoryItem('assets/icon/home_gastro.png', 'Gastroenterology')),
                      
                  GestureDetector(
                    onTap: (){},
                    child: _buildCategoryItem('assets/icon/home_lab.png', 'Laboratory')),
                      
                  GestureDetector(
                    onTap: (){},
                    child: _buildCategoryItem('assets/icon/home_vac.png', 'Vaccination')),
                ],
              ),
                      
            ],
          ),
                      
          const SizedBox(height: 10.0),
                      
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nearby Medical Centers',style: h3),
                  TextButton(
                    onPressed: (){}, 
                    child: Text('See All',style: bodySregular),
                  ),
                ],
              ),
                      
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: PlaceList.map((place) {
                      
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        width: 230, height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(image: AssetImage(place.imageUrl),
                          fit: BoxFit.cover,
                          ), 
                          boxShadow: [
                            BoxShadow(
                              color: primaryGrey.shade200,
                              spreadRadius: 5,
                              blurRadius: 8,
                              offset: Offset(0, 5),
                            ),
                          ],           
                          
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 8,
                              top: 8,
                              child: Consumer<FavouriteProvider>(
                                builder: (context, provider, child){
                                return Container(
                                  width: 30, 
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle, 
                                    color: primaryGrey.shade500.withOpacity(0.4),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      provider.isFavourite(place)
                                                ? Iconsax.heart5
                                                : Iconsax.heart,
                                            color: Colors.white,
                                            size: 15.0), 
                                    onPressed: () {
                                      provider.toggleLocationFavourite(place);
                                    },
                                  ),
                                );
                               }, 
                              ),
                            ),
                            
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 45,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0,left: 10.0,bottom: 10.0),
                                  child: Text(place.name, style: h4),
                                ),
                              ),
                            ),
                          ],
                        ), 
                      ),
                    );}).toList(),
                  
                ),
              ),
                      
            ],
          ),
        ],
            ),
        ),
      ),
    
    );
  }
}

String selectDoctor = "";

Widget _buildCategoryItem(String imagePath, String category) {
  return Column(
    children: [
      Container(
        width: 60.0, // Set a fixed width for the container
        child: Column(
          children: [
            Image.asset(imagePath, width: 60.0, height: 60.0), // Set the width and height of the image
            const SizedBox(height: 5.0),
            Text(
              category,
              style: bodyXSregular,
              maxLines: 1, // Limit the text to one line
              overflow: TextOverflow.ellipsis, // Add ellipsis (...) if text overflows
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _builderCardSlider(String dRimage, String text1, String text2){
  return Container(
    //height: 55.0, width: 205.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0), 
    ),
    child:Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image(
            image: AssetImage(dRimage),
            fit: BoxFit.fill),
        ),
        Positioned(
          top: 35.0,
          left:10.0,
          child: Text(text1,style: h2white),
        ),
        Positioned(
          top: 100.0,
          left:10.0,
          child: Text(text2,style: bodyXSregularWhite),
        ),
      ],
    ),
  );
                
}

