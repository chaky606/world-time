import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{  // <-- used for waiting response processing
    // make the request
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Phnom_Penh'));  // <-- get API address from http
    Map data = jsonDecode(response.body);  // <-- get API properties to List by convert to string by use jsonDecode
    // print(data['title']);
    // print(data);

    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    // print(offset);

    //create DateTime Object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override       // <-- created initState function
  void initState() {
    super.initState();
    getTime();
  }

  @override  // <-- body of StateFull
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading Screen'),
    );
  }
}
