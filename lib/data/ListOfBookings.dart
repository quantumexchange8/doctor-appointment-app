class UpcomingBookings{
  final String time;
  final String imageUrl;
  final String name;
  final String field;
  final String location;

  UpcomingBookings({
    required this.time,
    required this.imageUrl,
    required this.name,
    required this.field,
    required this.location,
  });

}

List<UpcomingBookings> upBookingsLists = [
  UpcomingBookings(
    time: 'May 22,2023 - 10.00AM', 
    imageUrl: 'assets/image/doctor3.png', 
    name: 'Dr. James Robinson', 
    field: 'Orthopedic Surgery', 
    location: 'Elite Ortho Clinic, USA',
  ),
   UpcomingBookings(
    time: 'June 14, 2023 - 03.00 PM', 
    imageUrl: 'assets/image/search_doctor12.png', 
    name: 'Dr. Daniel Lee', 
    field: 'Gastroenterologist', 
    location: 'Digestive Institute, USA',
  ),
  UpcomingBookings(
    time: 'June 21, 2023 - 10.00 AM', 
    imageUrl: 'assets/image/search_doctor1.png', 
    name: 'Dr. David Patel', 
    field: 'Cardiologist', 
    location: 'Cardiology Center, USA',
  ),
   UpcomingBookings(
    time: 'July 25, 2023 - 10.00 AM', 
    imageUrl: 'assets/image/search_doctor5.png', 
    name: 'Dr. David Patel', 
    field: 'Dentist', 
    location: 'Smile Daily Dental Clinic',
  ),
];

class CompletedBookings{
  final String time;
  final String imageUrl;
  final String name;
  final String field;
  final String location;

  CompletedBookings({
    required this.time,
    required this.imageUrl,
    required this.name,
    required this.field,
    required this.location,
  });

}

List<CompletedBookings> comBookingsLists = [
  CompletedBookings(
    time: 'March 12,2023 - 11.00AM', 
    imageUrl: 'assets/image/search_doctor8.png', 
    name: 'Dr. Sarah Johnson', 
    field: 'Gynecologist', 
    location: 'Women\'s Health Clinic',
  ),
   CompletedBookings(
    time: 'March 2, 2023 - 12.00 PM', 
    imageUrl: 'assets/image/search_doctor11.png', 
    name: 'Dr. Michael Chang', 
    field: 'Cardiologist', 
    location: 'HeartCare Center, USA',
  ),
  CompletedBookings(
    time: 'February 2, 2023 - 09.00 AM', 
    imageUrl: 'assets/image/search_doctor5.png', 
    name: 'Dr. David Patel', 
    field: 'Dentist', 
    location: 'Smile Daily Dental Clinic',
  ),
  
];

class CanceledBookings{
  final String time;
  final String imageUrl;
  final String name;
  final String field;
  final String location;

  CanceledBookings({
    required this.time,
    required this.imageUrl,
    required this.name,
    required this.field,
    required this.location,
  });

}

List<CanceledBookings> canBookingsLists = [
  CanceledBookings(
    time: 'April 19,2023 - 02.00PM', 
    imageUrl: 'assets/image/doctor2.png', 
    name: 'Dr. Jessica Turner', 
    field: 'Gynecologist', 
    location: 'Women\'s Clinic, Seatle, USA',
  ),
   CanceledBookings(
    time: 'February 28, 2023 - 05.00 PM', 
    imageUrl: 'assets/image/search_doctor4.png', 
    name: 'Dr. Emily Walker', 
    field: 'Pediatrics', 
    location: 'Serenity Pediatrics Clinic',
  ),
   CanceledBookings(
    time: 'January 28, 2023 - 03.00 PM', 
    imageUrl: 'assets/image/doctor1.png', 
    name: 'Dr. Catherine Bender', 
    field: 'Pediatrics', 
    location: 'Serenity Pediatrics Clinic',
  ),
];