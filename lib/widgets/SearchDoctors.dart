import 'package:doctor_appointment_app/Pages/DoctorDetailsPage.dart';
import 'package:doctor_appointment_app/controllers/favourite_provider.dart';
import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/data/DoctorData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class SearchDoctor extends StatefulWidget {
  const SearchDoctor({super.key});

  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {

  TextEditingController selectedDoctor = TextEditingController();
  String selectedField = 'All';
  String text = '';

  

List<Item> getFilteredDoctor(){
  if(selectedField == 'All'){
    return ListDoctor
    .where((element) => element.name.toLowerCase().contains(text.toLowerCase()))
    .toList();
  }else{
    return ListDoctor
    .where((element) => element.position == selectedField &&
    element.name.toLowerCase().contains(text.toLowerCase()))
    .toList();
  }
}

int getDoctorCount(String selectedField){
  if(selectedField=='All'){
    return ListDoctor.length;
  }else{
    return ListDoctor.where((element)=>element.position == selectedField).length;
  }
}

  @override
  void dispose(){
    selectedDoctor.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {

    
    List<Item> searchList = getFilteredDoctor();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('All Doctors'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: 45,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryGrey.shade100,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: primaryGrey.shade100),
                ),
              child: TextFormField(             
                onChanged: (value){
                  setState(() {
                    text = value;
                  });
                },
                controller: selectedDoctor,
                /*onFieldSubmitted: (covariant){
                  setState(() {
                    text = covariant;
                  });
                },*/
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(9),
                  border: InputBorder.none,
                  prefixIcon: Icon(Iconsax.search_normal, color: primaryGrey.shade400, size: 25.0),
                  hintText: 'Search doctor...',
                  hintStyle: bodySregular,
                ),
              ), 
              ),

              const SizedBox(height: 20),

              //UI sections
              Container(
                height: 45,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      //call all doctors

                      _allDoctors('All'),
                      const SizedBox(width: 8),

                      //call specialists doctors

                      _singleSpecialist('General'),
                       const SizedBox(width: 8),
                      _singleSpecialist('Cardiologist'),
                       const SizedBox(width: 8),
                      _singleSpecialist('Dentist'),
                      const SizedBox(width: 8),
                      _singleSpecialist('Gynecologist'),
                      const SizedBox(width: 8),
                      _singleSpecialist('Orthopedic Surgery'),
                      const SizedBox(width: 8),
                      _singleSpecialist('Pediatrics'),
                      const SizedBox(width: 8),
                      _singleSpecialist('Gastroenterologist'),
                      

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              //Show how many results found and default
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${getDoctorCount(selectedField)} found/s', style: h4),
                  /*TextButton.icon(
                    label: Text('Default',style: bodySregular),
                    onPressed: (){}, 
                    icon: Icon(Iconsax.arrow_3,color: primaryGrey.shade500,size: 15.0),
                  ),*/
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // Adjust padding if necessary
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Default', style: bodySregular),
                        const SizedBox(width: 3), 
                        Icon(Iconsax.arrow_3, color: primaryGrey.shade500, size: 15.0),
                      ],
                    ),
                  ),
                ],
              ),
  
              //display details of doctors

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: searchList.length,
                itemBuilder: ((context, index) {
                 // return _buildDoctorCard(searchList[index]);
                 return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)=> DoctorDetails(doctor: searchList[index])),
                    );
                  },
                  child: _buildDoctorCard(searchList[index]),
                 );
                
              }),
              ),
          
            ],
          ),
        ),
      ),
    );
  }


Widget _allDoctors(String searchText){
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      elevation: 2,
      backgroundColor: selectedField == 'All'?
      primaryGrey.shade900:Colors.white,
    ),
    child: selectedField =='All'? 
      Text('All', style: h2white):Text('All', style: h2grey),
    onPressed:(){ //print('Button tapped: $searchText');
     setState(() {
       selectedField = 'All';
       text = '';
     });
    },
  );
}

Widget _singleSpecialist(String searchText){
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      elevation: 2,
      backgroundColor: selectedField == searchText?
      primaryGrey.shade900:Colors.white,
    ),
    child: selectedField == searchText? 
      Text(searchText, style: h2white):Text(searchText, style: h2grey),
    onPressed: (){
      setState(() {
        selectedField = searchText;
        text='';
      });

      //print('Button tapped: $searchText');
    }, 
    
  );
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
          height: 130, // Set the card height
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 90, // Adjust the width as needed
                  height: 130, // Adjust the height as needed
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
                          SizedBox(
                            height: 15,
                            width: 25,
                            child: IconButton(
                              visualDensity: VisualDensity.compact,
                              onPressed: (){
                                provider.toggleFavourite(doctor);
                              }, 
                              icon: Icon(
                                provider.isExist(doctor) ? Iconsax.heart5 : Iconsax.heart, size: 15.0),
                            ),
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
    
                      //Rating
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Iconsax.star1,
                          size: 20.0, 
                          color: Color(0xfffeb052),
                          ),
                          const SizedBox(width: 3),
                          Text(doctor.starRate.toStringAsFixed(1),style: bodyXXSregular),
                          SizedBox(
                            height: 10,
                            child: VerticalDivider(
                              color: primaryGrey.shade300,
                              thickness: 1,
                            ),
                          ),
                          Text('${doctor.review.toStringAsFixed(0)} Reviews',style: bodyXXSregular),
                        ],
                      ),
    
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
}









