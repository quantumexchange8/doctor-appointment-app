import 'package:flutter/material.dart';

class aboutDoctor{
  final String doctorName;
  final String patients;
  final String exp;
  final String aboutMe;
  final String workTime;
  final TimeOfDay startWorkingTime;
  final TimeOfDay endWorkingTime;

  aboutDoctor({
    required this.doctorName,
    required this.patients,
    required this.exp,
    required this.aboutMe,
    required this.workTime,
    required this.startWorkingTime,
    required this.endWorkingTime,
  });
}

List<aboutDoctor> DetailsList = [
  aboutDoctor(
    doctorName: 'Dr. David Patel',
    patients: '2,000+', 
    exp: '10+', 
    aboutMe: 'Dr. David Patel, a dedicated cardiologist, brings a wealth of experience to Golden Gate Cardiology Center in Golden Gate, CA. With over a decade in the field, Dr. Patel is known for his patient-centered approach and expertise in treating complex cardiovascular conditions. He is committed to staying abreast of the latest advancements in cardiology to provide his patients with the best possible care.', 
    workTime: 'Monday-Friday, 08.00 AM-06.00 PM',
    startWorkingTime: TimeOfDay(hour: 8, minute: 0),
    endWorkingTime: TimeOfDay(hour: 18, minute: 0),
  ),

  aboutDoctor(
    doctorName: 'Dr. Jessica Turner',
    patients: '1,600+', 
    exp: '12+', 
    aboutMe: 'Dr. Jessica Turner, a highly skilled gynecologist, provides top-notch care at Women\'s Clinic, Seatle,USA. Dr. Turner has over 12 years of experience in women\'s health, specializing in both routine and high-risk obstetrics, reproductive health, and menopause management. Her empathetic nature and dedication to patient education make her a trusted advocate for women\'s health.', 
    workTime: 'Monday-Friday, 09.00 AM-05.00 PM',
    startWorkingTime: TimeOfDay(hour: 9, minute: 0),
    endWorkingTime: TimeOfDay(hour: 17, minute: 0),
  ),

  aboutDoctor(
    doctorName: 'Dr. Michael Johnson',
    patients: '3,000+', 
    exp: '15+', 
    aboutMe: 'Dr. Michael Johnson, an expert in orthopedic surgery, serves patients at Orthopedic Specialists in Maple Associates,NY,USA. With 15 years of experience, Dr. Johnson is renowned for his expertise in joint replacement, sports injuries, and minimally invasive surgical techniques. His commitment to patient recovery and rehabilitation ensures optimal outcomes for his patients.', 
    workTime: 'Monday-Friday, 07.00 AM-05.00 PM',
    startWorkingTime: TimeOfDay(hour: 7, minute: 0),
    endWorkingTime: TimeOfDay(hour: 17, minute: 0),
  ),

  aboutDoctor(
    doctorName: 'Dr. Emily Walker',
    patients: '1,900+', 
    exp: '10+', 
    aboutMe: 'Dr. Emily Walker, a dedicated pediatrician, offers compassionate care at Serenity Pediatrics Clinic. Dr. Walker has a decade of experience in pediatrics, focusing on preventive care, chronic illness management, and developmental health. Her gentle approach and ability to connect with children and their families make her a beloved figure in the community.', 
    workTime: 'Monday-Friday, 08.00 AM-05.00 PM',
    startWorkingTime: TimeOfDay(hour: 8, minute: 0),
    endWorkingTime: TimeOfDay(hour: 17, minute: 0),
  ),

  aboutDoctor(
    doctorName: 'Dr. Peter Parker',
    patients: '900+', 
    exp: '7+', 
    aboutMe: 'Dr. Peter Parker, a skilled dentist, ensures bright smiles at Smile Daily Dental Clinic. With over 7 years in dentistry, Dr. Parker excels in cosmetic and restorative dentistry, offering services such as teeth whitening, veneers, and dental implants. His friendly demeanor and attention to detail ensure a comfortable experience for all his patients.', 
    workTime: 'Monday-Friday, 09.00 AM-05.00 PM',
    startWorkingTime: TimeOfDay(hour: 9, minute: 0),
    endWorkingTime: TimeOfDay(hour: 17, minute: 0),
  ),

  aboutDoctor(
    doctorName: 'Dr. Catherine Bender',
    patients: '1,500+', 
    exp: '12+', 
    aboutMe: 'Dr. Catherine Bender, a compassionate pediatrician, ensures the best care at Serenity Pediatrics Clinic. Dr. Bender has over 12 years of experience in pediatrics, with a special focus on newborn care, immunizations, and adolescent health. Her holistic approach to healthcare and her dedication to creating a nurturing environment make her a favorite among parents and children alike.', 
    workTime: 'Monday-Friday, 08.00 AM-06.00 PM',
    startWorkingTime: TimeOfDay(hour: 8, minute: 0),
    endWorkingTime: TimeOfDay(hour: 18, minute: 0),
  ),

  aboutDoctor(
    doctorName: 'Dr. Emma Blent',
    patients: '2,500+', 
    exp: '14+', 
    aboutMe: 'Dr. Emma Blent, a trusted general practitioner, offers comprehensive care at Columbia Hospital. With 14 years of experience, Dr. Blent provides a wide range of services, from preventive health checks to managing chronic diseases. Her patient-centric approach and dedication to continuous learning ensure she delivers high-quality care tailored to each individual\'s needs.', 
    workTime: 'Monday-Friday, 08.00 AM-06.00 PM',
    startWorkingTime: TimeOfDay(hour: 8, minute: 0),
    endWorkingTime: TimeOfDay(hour: 18, minute: 0),
  ),

  aboutDoctor(
    doctorName: 'Dr. Sarah Johnson',
    patients: '1,300+', 
    exp: '10+', 
    aboutMe: 'Dr. Sarah Johnson, a devoted gynecologist, provides exceptional women\'s health services at Women\'s Health Clinic, WA. With a decade of experience, Dr. Johnson specializes in prenatal care, fertility treatments, and minimally invasive gynecologic surgeries. Her compassionate care and focus on patient education empower women to make informed decisions about their health.', 
    workTime: 'Monday-Friday, 08.30 AM-06.30 PM',
    startWorkingTime: TimeOfDay(hour: 8, minute: 30),
    endWorkingTime: TimeOfDay(hour: 18, minute: 30),
  ),

  aboutDoctor(
    doctorName: 'Dr. Rachel Adams',
    patients: '1,800+', 
    exp: '11+', 
    aboutMe: 'Dr. Racheal Adams, a compassionate and innovative gynecologist, delivers exceptional women\'s health services at Healthy Women Clinic, San Francisco. Dr. Adams is known for her expertise in reproductive health, menopausal management, and minimally invasive procedures. Her holistic approach and commitment to personalized care make her a trusted healthcare provider.', 
    workTime: 'Monday-Friday, 09.00 AM-05.00 PM',
    startWorkingTime: TimeOfDay(hour: 9, minute: 0),
    endWorkingTime: TimeOfDay(hour: 17, minute: 0),
  ),

  aboutDoctor(
    doctorName: 'Dr. James Anderson',
    patients: '2,800+', 
    exp: '54+', 
    aboutMe: 'Dr. James Anderson, a leading orthopedic surgeon, excels in patient care at Premier Orthopedics in New York, NY. With an illustrious career spanning over five decades, Dr. Anderson is a pioneer in orthopedic surgery, specializing in complex joint replacements and spine surgeries. His extensive experience and innovative techniques have earned him a reputation as a top surgeon in his field.', 
    workTime: 'Monday-Friday, 07.30 AM-05.30 PM',
    startWorkingTime: TimeOfDay(hour: 7, minute: 30),
    endWorkingTime: TimeOfDay(hour: 17, minute: 30),
  ),

  aboutDoctor(
    doctorName: 'Dr. Michael Chang',
    patients: '2,200+', 
    exp: '13+', 
    aboutMe: 'Dr. Michael Chang, a renowned cardiologist, brings extensive expertise to HeartCare Center, USA. With over 13 years in cardiology, Dr. Chang specializes in interventional cardiology, treating heart conditions with the latest minimally invasive techniques. His commitment to patient care and his ability to manage complex cases make him a highly sought-after cardiologist.', 
    workTime: 'Monday-Friday, 08.00 AM-06.00 PM',
    startWorkingTime: TimeOfDay(hour: 8, minute: 0),
    endWorkingTime: TimeOfDay(hour: 18, minute: 0),
  ),

  aboutDoctor(
    doctorName: 'Dr. Daniel Lee',
    patients: '2,300+', 
    exp: '15+', 
    aboutMe: 'Dr. Daniel Lee, a renowned gastroenterologist, combines cutting-edge techniques with personalized care at Digestive Wellness Center in San Antonio, TX. Dr. Lee is an expert in diagnosing and treating digestive disorders, including IBD, IBS, and liver diseases. His patient-focused approach and use of advanced diagnostic tools ensure comprehensive care for his patients.', 
    workTime: 'Monday-Friday, 07.00 AM-04.00 PM',
    startWorkingTime: TimeOfDay(hour: 7, minute: 0),
    endWorkingTime: TimeOfDay(hour: 16, minute: 0),
  ),

  aboutDoctor(
    doctorName: 'Dr. Laura White',
    patients: '2,000+', 
    exp: '13+', 
    aboutMe: 'Dr. Laura White, a dedicated pediatrician, ensures excellent care at Kids Health Pediatrics in Atlanta, GA. Dr. White specializes in preventive health, managing chronic conditions, and promoting healthy development in children. Her friendly and approachable nature, coupled with her medical expertise, makes her a trusted healthcare provider for families.', 
    workTime: 'Monday-Friday, 08.00 AM-05.00 PM',
    startWorkingTime: TimeOfDay(hour: 8, minute: 0),
    endWorkingTime: TimeOfDay(hour: 17, minute: 0),
  ),
];