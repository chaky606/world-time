import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  String? location; //location name for the UI
  String? time; // the time in that location
  String? flag; // url to an asset flag icon
  String? url; // location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{  // <-- used for waiting response processing
    try{
      // make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));  // <-- get API address from http
      Map data = jsonDecode(response.body);  // <-- get API properties to List by convert to string by use jsonDecode

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //create DateTime Object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set to time properties
      time = now.toString(); // <- convert time from int to string
    }

    catch (e){
      print('caught error: $e');
      // time='could not get time data';
    }

  }
}

