import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='Loading...';

  void setupWoldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Asia/Phnom_Penh');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time!;
    });
  }

  @override       // <-- created initState function
  void initState() {
    super.initState();
    setupWoldTime();
  }

  @override  // <-- body of StateFull
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Text(time),
    ),
    );
  }
}
