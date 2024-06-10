import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/widgets/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class BookAppointment extends StatefulWidget {
  final String doctorName;
  final TimeOfDay startWorkingTime;
  final TimeOfDay endWorkingTime;

  const BookAppointment({
    super.key,
    required this.doctorName,
    required this.startWorkingTime,
    required this.endWorkingTime,
  });

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  String? _selectedTime;
  DateTime? _selectedDate;
  List<String> _times = [];
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    _generateTimeSlots();
  }

  void _generateTimeSlots() {
    _times.clear();
    TimeOfDay currentTime = widget.startWorkingTime;

    while (currentTime.hour < widget.endWorkingTime.hour ||
        (currentTime.hour == widget.endWorkingTime.hour && currentTime.minute < widget.endWorkingTime.minute)) {
      // Convert to 12-hour format
      String hour = (currentTime.hour > 12) ? (currentTime.hour - 12).toString() : currentTime.hour.toString();
      String minute = currentTime.minute.toString().padLeft(2, '0');
      String period = (currentTime.hour >= 12) ? 'PM' : 'AM';

      _times.add('$hour:$minute $period');
      
      // Increment time by 30 minutes
      currentTime = TimeOfDay(
        hour: currentTime.minute + 30 >= 60 ? currentTime.hour + 1 : currentTime.hour,
        minute: (currentTime.minute + 30) % 60,
      );
    }
  }

  bool isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  Widget _dayBuilder({
      required DateTime date,
      BoxDecoration? decoration,
      bool? isDisabled,
      bool? isSelected,
      bool? isToday,
      TextStyle? textStyle}) {
        bool disabled = isDisabled ?? isWeekend(date);
        bool selected = isSelected ?? false;
        bool today = isToday ?? false;
       

      return GestureDetector(
        onTap: disabled
            ? null
            : () {
                setState(() {
                  _selectedDate = date;
                   formattedDate = DateFormat('MMMM dd, yyyy').format(_selectedDate!);
                   print('Selected date: $_selectedDate, Formatted date: $formattedDate');
                });
              },
        child: Container(
          width: 1,
          height: 30,
          decoration: BoxDecoration(
            color: selected
                ? primaryGrey.shade900
                : disabled
                    ? Colors.transparent
                    : today
                        ? primaryGrey.shade300
                        : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: disabled ? Colors.transparent : Colors.transparent,
            ),
          ),
          child: Center(
            child: Text(
              date.day.toString(),
              style: TextStyle(
                color: disabled
                    ? primaryGrey.shade300
                    : selected
                        ? Colors.white
                        : Colors.black,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      );
     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment', style: h1),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Date', style: h2grey),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container( //set the box design for calendar
                      decoration: BoxDecoration(
                        color: primaryGrey.shade50,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          firstDayOfWeek: 0,
                          calendarViewMode: CalendarDatePicker2Mode.day,
                          calendarType: CalendarDatePicker2Type.single,
                          selectedDayTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                          selectedDayHighlightColor: primaryGrey.shade900,
                          lastMonthIcon: Icon(Icons.arrow_left_rounded, size: 35, color: primaryGrey.shade900),
                          nextMonthIcon: Icon(Icons.arrow_right_rounded,size: 35, color: primaryGrey.shade900),
                                  
                          dayBuilder: ({
                            required DateTime date,
                            BoxDecoration? decoration,
                            bool? isDisabled,
                            bool? isSelected,
                            bool? isToday,
                            TextStyle? textStyle,
                          }) {
                            return _dayBuilder(
                              date: date,
                              isDisabled: isWeekend(date),
                              isSelected: _selectedDate != null && _selectedDate!.isAtSameMomentAs(date),
                              isToday: DateTime.now().day == date.day && DateTime.now().month == date.month && DateTime.now().year == date.year,
                            );
                          },
                        ),
                        value: _selectedDate != null ? [_selectedDate!] : [],
                        onValueChanged: (dates) {
                          if (dates.isNotEmpty && !isWeekend(dates[0]!)) {
                            setState(() {
                              _selectedDate = dates[0];
                              // Check if _selectedDate is not null before formatting
                              if (_selectedDate != null) {
                                formattedDate = DateFormat('MMMM dd, yyyy').format(_selectedDate!);
                              } else {
                                // Handle the case where _selectedDate is null
                                formattedDate = ''; // Or any default value you want to use
                              }
                              print('Selected date: $_selectedDate, Formatted date: $formattedDate');
                            });
                          }
                        },
                        
                      ),
                    ),
                  ),

                  
                  const SizedBox(height: 20),
                  Text('Select Hour', style: h2grey),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 12,
                      childAspectRatio: 3, // Adjust the aspect ratio as needed
                    ),
                    itemCount: _times.length,
                    itemBuilder: (context, index) {
                      final time = _times[index];
                      return FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: _selectedTime == time ? primaryGrey.shade900 : primaryGrey.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5), // Adjust the padding as needed
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedTime = time;
                          });
                        },
                        child: Text(
                          time,
                          style: _selectedTime == time ? bodySboldWhite : bodySsemibold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          
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
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                           backgroundColor: Colors.white,
                            content: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: MediaQuery.of(context).size.height * 0.48,
                              ),
                              child: Column(
                                children: [
                                  Image.asset('assets/image/tick_profile.png'),
                                  const SizedBox(height: 30.0),
                                  Text('Congratulations!', style: h3, textAlign: TextAlign.center),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    'Your appointment with ${widget.doctorName} is confirmed for $formattedDate, at $_selectedTime.',
                                    style: bodySmedium,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: FilledButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context, 
                                              MaterialPageRoute(builder: (context)=> BottomNavBar()),
                                            );
                                          },
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateColor.resolveWith(
                                                (states) => primaryGrey.shade900),
                                            fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(45.0)),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(25.0)),
                                            ),
                                          ),
                                          child: const Text('Done'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context, 
                                        MaterialPageRoute(builder: (context)=>BottomNavBar(initialIndex: 2)),
                                      );
                                    },
                                    child: Text('Edit your appointment', style: bodySregular),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade900),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                      child: Text('Confirm', style: bodySboldWhite),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
