import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
  // creating first page route
  initialRoute: '/home',
  // create page route map
  routes: {
    '/': (context) => const Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));

