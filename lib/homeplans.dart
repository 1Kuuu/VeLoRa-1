import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        centerTitle: false,
        backgroundColor: Colors.brown[800],
        actions: [
          IconButton(
            icon: Icon(Icons.cloud_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.brown[700],
              child: Text(
                "M",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Weekly Progress Section
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProgressCard(title: "Activities", value: "0"),
                ProgressCard(title: "Time", value: "0h 0m"),
                ProgressCard(title: "Distance", value: "0.00km"),
              ],
            ),
          ),

          // Calendar Section
          Container(
            padding: EdgeInsets.all(12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined, size: 16),
                    SizedBox(width: 8),
                    Text(
                      "December 2024",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                      .map((day) => Expanded(
                            child: Center(
                              child: Text(
                                day,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ))
                      .toList(),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [20, 21, 22, 23, 24, 25, 26]
                      .map((date) => Expanded(
                            child: Center(
                              child: Text(
                                date.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),

          // Schedule Section
          Expanded(
            child: ListView(
              children: [
                ScheduleCard(
                  time: "8:00AM",
                  title: "10KM RIDE WITH MY FRIEND",
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                ),
                ScheduleCard(
                  time: "10:00AM",
                  backgroundColor: Colors.brown[300],
                ),
                ScheduleCard(
                  time: "11:00AM",
                  backgroundColor: Colors.brown[400],
                ),
                ScheduleCard(
                  time: "2:00PM",
                  backgroundColor: Colors.yellow[200],
                  icon: Icons.add,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[800],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}

class ProgressCard extends StatelessWidget {
  final String title;
  final String value;

  const ProgressCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String time;
  final String? title;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;

  const ScheduleCard({
    super.key,
    required this.time,
    this.title,
    this.backgroundColor,
    this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Row(
        children: [
          Text(time),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 60,
              color: backgroundColor ?? Colors.grey[300],
              child: Center(
                child: icon != null
                    ? Icon(icon, size: 32, color: Colors.black)
                    : Text(
                        title ?? '',
                        style: TextStyle(
                          color: textColor ?? Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
