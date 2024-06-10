class Place{
  final String imageUrl;
  final String name;
  final String address;
  final double starRate;
  final int clinicReview;
  final String distance;
  final String type;

  Place({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.starRate,
    required this.clinicReview,
    required this.distance,
    required this.type,
  });
}

List<Place>PlaceList = [
  Place(
    imageUrl: 'assets/image/home_place1.png', 
    name: 'Sunrise Health Clinic', 
    address: '123 Oak Street, CA 98765', 
    starRate: 5.0, 
    clinicReview: 58, 
    distance: '2.5 km/40min',
    type: 'Hospital',
  ),

  Place(
    imageUrl: 'assets/image/home_place2.png',
    name: 'Golden Cardiologist',
    address: '555 Bridge Street, CO',
    starRate: 4.9,
    clinicReview: 1088,
    distance: '2.5 km/40min',
    type: 'Hospital',
  ),

  Place(
    imageUrl: 'assets/image/home_place3.png',
    name: 'LEONG EEG Room (Electroencephalography)',
    address: '456 Wellness Rd, San Francisco, CA, USA (HWC)',
    starRate: 4.8,
    clinicReview: 798,
    distance: '3.0 km/50min',
    type: 'Hospital',
  ),
];