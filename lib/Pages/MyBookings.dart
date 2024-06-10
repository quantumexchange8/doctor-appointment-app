import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/data/ListOfBookings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: const [
              Tab(
                text: 'Upcoming',
              ),
              Tab(
                text: 'Completed',
              ),
              Tab(
                text: 'Canceled',
              ),
            ],
            labelStyle: h3,
            unselectedLabelStyle: h3_5,
            indicatorColor: primaryGrey.shade900,
          ),
          title: Text('My Bookings', style: h1),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
        
            //Upcoming page
            SingleChildScrollView(
              child: Column(
                children: upBookingsLists
                    .map((booking) => _upcomingBookings(booking))
                    .toList(),
              ),
            ),
        
            //Completed
            SingleChildScrollView(
              child: Column(
                children: comBookingsLists
                    .map((booking) => _completedBookings(booking))
                    .toList(),
              ),
            ),
            /*ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: comBookingsLists.length,
                itemBuilder: ((context, index) {
                  return _completedBookings(comBookingsLists[index]);
              }),
            ),*/
        
            //Canceled
            SingleChildScrollView(
              child: Column(
                children: canBookingsLists
                    .map((booking) => _canceledBookings(booking))
                    .toList(),
              ),
            ),
        
          ],
        ),
      
       
      ),
    );
  }
Widget _upcomingBookings (UpcomingBookings booking){
  return Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0 ),
                child: SizedBox(
                  height: 230.0,
                  child: Card.filled(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(booking.time, style: bodySbold),

                        Divider(thickness: 1, color: primaryGrey.shade300, height:25.0),

                        Row(
                          children: [
                            Container(
                              width: 100, // Adjust the width as needed
                              height: 100, // Adjust the height as needed
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(booking.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(booking.name, style: h3),
                                const SizedBox(height: 5.0),
                                Text(booking.field,style: bodySsemibold),
                                const SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    Icon(Iconsax.location, color: primaryGrey.shade500, size:15),
                                    Text(booking.location, style: bodySregular),
                                  ],
                                ),
                              ],
                            ),
                          )
                          ],
                        ),
                        Divider(thickness: 1, color: primaryGrey.shade300, height:20.0),

                        //button for upcoming (cancel and reschedule)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 35.0, width: 155.0,
                              child: FilledButton(
                                onPressed: (){},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade200),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),),
                                  ), 
                                child: Text('Cancel', style: bodySbold),
                              ),
                            ),

                            SizedBox(
                              height: 35.0, width: 155.0,
                              child: FilledButton(
                                onPressed: (){},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade900),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),),
                                  ), 
                                child: Text('Reschedule', style: bodySboldWhite),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    ),  
                  ),
                ),             
            );
}

Widget _completedBookings (CompletedBookings booking){
  return Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0 ),
                child: SizedBox(
                  height: 230.0,
                  child: Card.filled(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(booking.time, style: bodySbold),

                        Divider(thickness: 1, color: primaryGrey.shade300, height:25.0),

                        Row(
                          children: [
                            Container(
                              width: 100, // Adjust the width as needed
                              height: 100, // Adjust the height as needed
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(booking.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(booking.name, style: h3),
                                const SizedBox(height: 5.0),
                                Text(booking.field,style: bodySsemibold),
                                const SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    Icon(Iconsax.location, color: primaryGrey.shade500, size:15),
                                    Text(booking.location, style: bodySregular),
                                  ],
                                ),
                              ],
                            ),
                          )
                          ],
                        ),
                        Divider(thickness: 1, color: primaryGrey.shade300, height:20.0),

                        //button for upcoming (cancel and reschedule)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 35.0, width: 155.0,
                              child: FilledButton(
                                onPressed: (){},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade200),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),),
                                  ), 
                                child: Text('Re-Book', style: bodySbold),
                              ),
                            ),

                            SizedBox(
                              height: 35.0, width: 155.0,
                              child: FilledButton(
                                onPressed: (){},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade900),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),),
                                  ), 
                                child: Text('Add Review', style: bodySboldWhite),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    ),  
                  ),
                ),             
            );
}

Widget _canceledBookings (CanceledBookings booking){
  return Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0 ),
                child: SizedBox(
                  height: 230.0,
                  child: Card.filled(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(booking.time, style: bodySbold),

                        Divider(thickness: 1, color: primaryGrey.shade300, height:25.0),

                        Row(
                          children: [
                            Container(
                              width: 100, // Adjust the width as needed
                              height: 100, // Adjust the height as needed
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(booking.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(booking.name, style: h3),
                                  const SizedBox(height: 5.0),
                                  Text(booking.field,style: bodySsemibold),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Icon(Iconsax.location, color: primaryGrey.shade500, size:15),
                                      Expanded(
                                        
                                        child:Text(booking.location, style: bodySregular,maxLines: 1,
                                        overflow: TextOverflow.ellipsis,),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                          ],
                        ),
                        Divider(thickness: 1, color: primaryGrey.shade300, height:20.0),

                        //button for upcoming (cancel and reschedule)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 35.0, width: 155.0,
                              child: FilledButton(
                                onPressed: (){},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade200),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),),
                                  ), 
                                child: Text('Re-Book', style: bodySbold),
                              ),
                            ),

                            
                          ],
                        ),

                      ],
                    ),
                    ),  
                  ),
                ),             
            );
}


}