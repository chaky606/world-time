import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async{  // <-- used for waiting response processing
    Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));  // <-- get API address from http
    Map data = jsonDecode(response.body);  // <-- get API properties to List by convert to string by use jsonDecode
    print(data['title']);
  }

  @override       // <-- created initState function
  void initState() {
    super.initState();
    getData();
  }

  @override  // <-- body of StateFull
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading Screen'),
    );
  }
}
