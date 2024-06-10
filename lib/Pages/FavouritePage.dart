import 'package:doctor_appointment_app/Pages/DoctorDetailsPage.dart';
import 'package:doctor_appointment_app/data/DoctorData.dart';
import 'package:doctor_appointment_app/widgets/LocationContainer.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:doctor_appointment_app/controllers/favourite_provider.dart';
import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';

class FavouritePage extends StatefulWidget {
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteProvider(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Favorites', style: h1),
            centerTitle: true,
            bottom: TabBar(
              tabs: const [
                Tab(text: 'Doctors'),
                Tab(text: 'Hospitals'),
              ],
              labelStyle: h3,
              unselectedLabelStyle: h3_5,
              indicatorColor: primaryGrey.shade900,
            ),
          ),
          body: TabBarView(
            children: [
              _buildDRFavouriteList(context),
              
              _buildLocationFavouriteList(context),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDRFavouriteList(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    final favourites = provider.favourites;

    if (favourites.isEmpty) {
      return Center(child: Text('No favourites yet', style: h3));
    }

    return ListView.builder(
      itemCount: favourites.length,
      itemBuilder: (context, index) {
        final doctor = favourites[index];
        return _buildDoctorCard(doctor);
      },
    );
  }

  Widget _buildLocationFavouriteList(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    final favourites = provider.locationFavourites;

    if (favourites.isEmpty) {
      return Center(child: Text('No favourites yet', style: h3));
    }

    return ListView.builder(
      itemCount: favourites.length,
      itemBuilder: (context, index) {
        final place = favourites[index];
         // Implement this method
              return LocationContainer(
                place: place,
              );
          
      },
    );
  }

  Widget _buildDoctorCard(Item doctor) {
    final provider = Provider.of<FavouriteProvider>(context, listen: false);

  return GestureDetector(
    onTap: (){
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context)=>DoctorDetails(doctor: doctor)),
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
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
                                  //provider.toggleFavourite(doctor);
                                  _showRemoveFavouriteModal(context,doctor,provider);
      
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
      ),
    ),
  );
}

void _showRemoveFavouriteModal(BuildContext context, Item doctor, FavouriteProvider provider){
  showModalBottomSheet(
    context: context, 
    builder: ((context) {
      return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text('Remove from Favorites?', style: h3),
            ),
            Divider(thickness: 1, color: primaryGrey.shade300, height:20.0),
            //show the container of doctor
            _buildDoctorCard(doctor),
            const SizedBox(height: 10.0),

            Padding(
              padding: const EdgeInsets.only(top: 5.0,bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              
                  SizedBox(
                    height: 35.0, width: 145.0,
                    child: FilledButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade300),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                      ),
                      child: Text('Cancel', style: bodySbold),
                    ),
                  ),
              
                  SizedBox(
                    height: 35.0, width: 145.0,
                    child: FilledButton(
                      onPressed: (){
                        provider.toggleFavourite(doctor);
                        Navigator.pop(context);
              
                      }, 
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade900),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                      ),
                      child: Text('Yes, Remove', style:bodySboldWhite),
                    ),
                  ),
                ],
              ),
            ),

          ],
          
        ),
      );
      
    }));
}


 
}
