class Item{
  final String name;
  final String position;
  final String location;
  final String imageUrl;
  final double starRate;
  final int review;

  Item({
    required this.name,
    required this.position,
    required this.location,
    required this.imageUrl,
    required this.starRate,
    required this.review,
  });

}

List<Item> ListDoctor = [
  Item(
    name: 'Dr. David Patel', 
    position: 'Cardiologist', 
    location: 'Cardiology Center, USA', 
    imageUrl: 'assets/image/search_doctor1.png',
    starRate: 5,
    review: 1872,
  ),
  Item(
    name: 'Dr. Jessica Turner', 
    position: 'Gynecologist', 
    location: 'Women\'s Clinic, Seatle, USA', 
    imageUrl: 'assets/image/search_doctor2.png',
    starRate: 4.9,
    review: 127,
  ),
  Item(
    name: 'Dr. Michael Johnson', 
    position: 'Orthopedic Surgery', 
    location: 'Maple Associates, NY, USA', 
    imageUrl: 'assets/image/doctor3.png',
    starRate: 4.7,
    review: 5223,
  ),
  Item(
    name: 'Dr. Emily Walker', 
    position: 'Pediatrics', 
    location: 'Serenity Pediatrics Clinic', 
    imageUrl: 'assets/image/search_doctor4.png',
    starRate: 5,
    review: 405,
  ),
  Item(
    name: 'Dr. Peter Parker', 
    position: 'Dentist', 
    location: 'Smile Daily Dental Clinic', 
    imageUrl: 'assets/image/search_doctor5.png',
    starRate: 4.5,
    review: 85,
  ),
  Item(
    name: 'Dr. Catherine Bender', 
    position: 'Pediatrics', 
    location: 'Serenity Pediatrics Clinic', 
    imageUrl: 'assets/image/doctor1.png',
    starRate: 5,
    review: 256,
  ),
  Item(
    name: 'Dr. Emma Blent', 
    position: 'General', 
    location: 'Columbia Hospital', 
    imageUrl: 'assets/image/doctor2.png',
    starRate: 5,
    review: 599,
  ),
  Item(
    name: 'Dr. Sarah Johnson', 
    position: 'Gynecologist', 
    location: 'Women\'s Health Clinic', 
    imageUrl: 'assets/image/search_doctor8.png',
    starRate: 4.9,
    review: 1623,
  ),
  Item(
    name: 'Dr. Rachel Adams', 
    position: 'Gynecologist', 
    location: 'Healthy Women Clinic, San Francisco', 
    imageUrl: 'assets/image/search_doctor9.png',
    starRate: 4.7,
    review: 215,
  ),
  Item(
    name: 'Dr. James Anderson', 
    position: 'Orthopedic Surgery', 
    location: 'Columbia Hospital', 
    imageUrl: 'assets/image/search_doctor10.png',
    starRate: 4.8,
    review: 3421,
  ),
  Item(
    name: 'Dr. Michael Chang', 
    position: 'Cardiologist', 
    location: 'HeartCare Center, USA', 
    imageUrl: 'assets/image/search_doctor11.png',
    starRate: 4.7,
    review: 215,
  ),
  Item(
    name: 'Dr. Daniel Lee', 
    position: 'Gastroenterologist', 
    location: 'Digestive Institute, USA', 
    imageUrl: 'assets/image/search_doctor12.png',
    starRate: 5,
    review: 887,
  ),
  Item(
    name: 'Dr. Laura White', 
    position: 'Pediatrics', 
    location: 'Kids Health Pediatrics', 
    imageUrl: 'assets/image/search_doctor13.png',
    starRate: 4.9,
    review: 2215,
  ),
];