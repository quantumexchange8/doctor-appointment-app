class Noti{
  final String messageTitle;
  final String messageInfo;
  final String time;

Noti({
  required this.messageTitle,
  required this.messageInfo,
  required this.time,
});
}

List<Noti> notifications =[
  Noti(
    messageTitle: 'Appointment Success', 
    messageInfo: 'You have successfully booked your appointment with Dr. Emily Walker.', 
    time: '1h',
  ),
  Noti(
    messageTitle: 'Appointment Cancelled', 
    messageInfo: 'You have successfully cancelled your appointment with Dr. David Patel.', 
    time: '2h',
  ),
  Noti(
    messageTitle: 'Scheduled Changed', 
    messageInfo: 'You have successfully changed your appointment with Dr. Jessice Turner.', 
    time: '8h',
  ),

Noti(
    messageTitle: 'Appointment Success', 
    messageInfo: 'You have successfully booked your appointment with Dr. David Patel.', 
    time: '1d',
  ),
];