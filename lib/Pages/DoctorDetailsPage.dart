import 'package:doctor_appointment_app/Pages/BookAppointment.dart';
import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/controllers/favourite_provider.dart';
import 'package:doctor_appointment_app/controllers/helper.dart';
import 'package:doctor_appointment_app/data/DoctorData.dart';
import 'package:doctor_appointment_app/data/DoctorDetails.dart';
import 'package:doctor_appointment_app/data/ReviewDoctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';


class DoctorDetails extends StatefulWidget {
  final Item doctor;

  const DoctorDetails({Key? key, required this.doctor}) : super(key:key);
  
  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  late aboutDoctor doctorDetails;
  List<User> assignReviews = [];

  @override
  void initState(){
    super.initState();
    doctorDetails = DetailsList.firstWhere(
      (detail) => detail.doctorName == widget.doctor.name, 
      orElse: () => aboutDoctor(
        doctorName: 'N/A', 
        patients: 'N/A', 
        exp: 'N/A', 
        aboutMe: 'N/A', 
        workTime: 'N/A',
        startWorkingTime: Helper.convertToTimeOfDay(DateTime.now()),
        endWorkingTime: Helper.convertToTimeOfDay(DateTime.now()),
      ));

  assignReviews = UserReview.where((review) => review.drName == widget.doctor.name).toList();

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details', style: h1),
        centerTitle: true,
        //actions (favourite)
        actions: [
          _buildFavouriteIconButton(widget.doctor),
        ],
      ),

      //Scrollable

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //selected doctor container
                _buildDoctorCard(widget.doctor),
                          
                const SizedBox(height: 10),
                          
                //4 circle icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIcon(Iconsax.profile_2user5, 'patients', doctorDetails.patients),
                    const SizedBox(width: 15),
                    _buildIcon(Iconsax.medal5, 'experience', doctorDetails.exp),
                    const SizedBox(width: 15),
                    _buildIcon(Iconsax.star1, 'rating', widget.doctor.starRate.toString()),
                    const SizedBox(width: 15),
                    _buildIcon(Iconsax.messages_15, 'reviews', widget.doctor.review.toString()),
                  ],
                ),
                const SizedBox(height: 15.0),
                          
                          
                //About doctor with view more function
                Text('About me', style: h2grey),
                const SizedBox(height: 5.0),
                //Text(doctorDetails?.aboutMe ?? 'Desciption not available', style: bodySregular),
                ReadMoreText(
                  doctorDetails.aboutMe, style: bodySregular, 
                  //textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimLines: 3,
                  //colorClickableText: primaryGrey.shade900,
                  trimCollapsedText: 'view more',
                  trimExpandedText: 'view less',
                  moreStyle: TextStyle(
                    color: primaryGrey.shade900,
                    decoration: TextDecoration.underline,
                  ),
                  lessStyle: TextStyle(
                    color: primaryGrey.shade900,
                    decoration: TextDecoration.underline,
                  ),
                ),
                          
                const SizedBox(height: 15.0),    
                          
                //working time
                Text('Working Time', style: h2grey),
                const SizedBox(height: 5.0),
                Text(doctorDetails.workTime, style: bodySregular),                       
                const SizedBox(height: 15.0), 
                
                //reviews with see all functions //user (profile picture, name, rating, review)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Reviews', style: h3),
                    TextButton(
                      onPressed: (){}, 
                      child: Text('See All',style: bodyXSregularGrey)),
                  ],
                ),
            
                _buildUserReview(assignReviews),
               
                ],
              ),
            ),
          ),

          //always shown button at bottom
           Align(
                alignment: Alignment.bottomCenter,
                child: BottomAppBar(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookAppointment(
                                    doctorName: widget.doctor.name,
                                    startWorkingTime: doctorDetails.startWorkingTime,
                                    endWorkingTime: doctorDetails.endWorkingTime,
                                  ),
                                ),
                              );
                            },
                            style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade900),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                          ),
                          child: Text('Book Appointment', style: bodySboldWhite)),
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Widget _buildFavouriteIconButton(Item doctor){
    final provider = Provider.of<FavouriteProvider>(context, listen: false);

    return Consumer<FavouriteProvider>(
      builder: (context, provider, child){
      return IconButton(
        onPressed: (){
          provider.toggleFavourite(doctor);
        }, 
        icon: Icon(provider.isExist(doctor)? Iconsax.heart5:Iconsax.heart, size:20.0),
      );
    },);
  }

  Widget _buildDoctorCard(Item doctor) {

  final provider = Provider.of<FavouriteProvider>(context, listen: false);

  return Consumer<FavouriteProvider>(
    builder: (context,provider,child){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Card.filled(
        color: Colors.white, // Set the card color
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          height: 120, // Set the card height
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 90, // Adjust the width as needed
                  height: 110, // Adjust the height as needed
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(doctor.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
                    children: [
    
                      //Doctor name and favourite selection
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name,
                            style: h4,
                          ),
                                                   
                        ],
                      ),
                      Divider(
                        height: 12,
                        color: primaryGrey.shade200,
                        thickness: 1,
                      ),
                      const SizedBox(height: 2),
    
                      Text(
                        doctor.position,
                        style: bodyXSsemibold,
                      ),
                      const SizedBox(height: 5),
    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Iconsax.location,size: 15.0, color: primaryGrey.shade700),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              doctor.location,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: bodyXSregular,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );},
  );
}

Widget _buildIcon (IconData icon, String label, String value){
  return Column(
    children: [
      Container(
                  width: 50, height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryGrey.shade200,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(icon, color: primaryGrey.shade900,size: 30.0),
                  //label below icons
      ),      
      const SizedBox(height: 3.0),    
      Text(value, style: bodyXSsemibold),
      const SizedBox(height: 3.0),
      Text(label, style: bodyXSregularGrey)
    ],
  );
}

Widget _buildUserReview(List<User>reviews){
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: reviews.length,
    itemBuilder: ((context, index) {
      final review = reviews[index];
      return Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(review.picUrl),
              ),
              const SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(review.userName, style: bodyLG),
                  Row(
                    children: [
                      Text(review.rating.toString(), style: bodyXSregular),
                      const SizedBox(width: 3),
                      //star rate bar
                      Row(
                        children: List.generate(5, (i) {
                              return Icon(
                                Iconsax.star1, 
                                color: i < review.rating ? Colors.amber : Colors.grey,
                                size: 15,
                              );
                        }),
                      )
                    ],
                  ),

                  
                ],
              ),
            ],),

            const SizedBox(height: 10),

          ReadMoreText(
            review.textReview, style: bodySregular,
            textAlign: TextAlign.justify,
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimExpandedText: 'view more',
            trimCollapsedText: 'view less',
            lessStyle: TextStyle(
              color: primaryGrey.shade900,
              decoration: TextDecoration.underline,
            ),
            moreStyle: TextStyle(
              color: primaryGrey.shade900,
              decoration: TextDecoration.underline,
            ),
          ),

          Divider(thickness: 1, color: primaryGrey.shade100, height: 20),

        ],
      );
    }),
  );
}


}