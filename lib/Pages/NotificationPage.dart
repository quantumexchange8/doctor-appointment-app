import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/data/NotiAppointmentData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification', style: h1),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 20, width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: primaryGrey.shade700,
              ),
              child: Text('1 New', style: bodyXSregularWhite,textAlign: TextAlign.center),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TODAY', style: bodySregular),
                  TextButton(
                    onPressed: (){}, 
                    child: Text('Mark all as read', style: bodyXSbold),),
                ],
              ),
              listViewMessage(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('YESTERDAY', style: bodySregular),
                  TextButton(
                    onPressed: (){}, 
                    child: Text('Mark all as read', style: bodyXSbold),),
                ],
              ),
              listViewMessage(),
              

            ],
          ),
        ),
        
      ),
    );
  }


  Widget listViewMessage(){
    return Column(
      children: List.generate(notifications.length, (index) => listViewItem(index)),
    );
  }

  Widget listViewItem(int index){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          message(index, notifications[index]),
          
        ],
      ),
    );
  }

  Widget message(int index, Noti notification){
   
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        prefixIcon(notification),
        const SizedBox(width: 10),
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(notification.messageTitle, style: bodySbold),
                  
                  Text(notification.time, style: bodyXSregular),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                notification.messageInfo, 
                style: bodyXSregular, 
                maxLines: 2, 
                overflow: TextOverflow.ellipsis
              ),
              Divider(height: 8, color: primaryGrey.shade50),
            ],
          ),
        ),
      ],
    );
  }

  Widget prefixIcon(Noti notification){
    IconData icon;
    Color iconColor;
    Color backgroundColor;

    if(notification.messageTitle == 'Appointment Success'){
      icon = Iconsax.calendar_tick;
      iconColor = Color(0xff014737);
      backgroundColor = Color(0xffdef7e5);
    }else if(notification.messageTitle == 'Appointment Cancelled'){
      icon = Iconsax.calendar_remove;
      iconColor = Color(0xff771d1d);
      backgroundColor = Color(0xfffde8e8);
    }else{
      icon = Iconsax.calendar_edit;
      iconColor = Color(0xff1c2a3a);
      backgroundColor = primaryGrey.shade200;
    }
    return Container(
          height: 50, width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          child: Icon(icon, color: iconColor), 
    );
  }

}