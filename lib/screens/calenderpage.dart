import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter/material.dart';
class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
   Map<DateTime, int> _data={
    DateTime(2023, 1, 6):1,
    DateTime(2023, 1, 7):2,
    DateTime(2023, 1, 8):3,
    DateTime(2023, 1, 9):4,
    DateTime(2023, 1, 13):5,
    DateTime(2023, 1, 16):5,
  };
  @override
  Widget build(BuildContext context) {
    return HeatMapCalendar(
  defaultColor: Colors.green[50],
  flexible: true,
  colorMode: ColorMode.opacity,
  textColor	:Colors.black,
  datasets: _data,
  colorsets:  const {
    1: Colors.green,
    2: Colors.orange,
    3: Colors.yellow,
    4: Colors.green,
    5: Colors.blue,
    6: Colors.indigo,
    7: Colors.purple,
  },
  onClick: (value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
  },
);
  }
}