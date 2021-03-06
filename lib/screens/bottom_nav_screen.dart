import 'package:flutter/material.dart';
import 'package:quarantips/screens/jadwal.dart';
import 'package:quarantips/screens/timer.dart';
import 'package:custom_timer/custom_timer.dart';
import 'screens.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late CustomTimerController timerController = CustomTimerController();

  @override
  void initState() {
    Duration timerDuration = const Duration(days: 14);
    super.initState();
  }

  final List _screens = [
    const HomeScreen(),
    infocovid(),
    //const Timer(),
    const Calendar(),
     Scaffold(),
     bantuan(),
    
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,

        elevation: 0.0,
        items: [
          
          Icons.home,
          Icons.coronavirus_outlined,
          Icons.av_timer_rounded,
          Icons.fact_check_outlined,
          Icons.event_note,
          
        ]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? Colors.blue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
