import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  late String location; // location name for the UI
  late String time; // the time for that location
  late String flag; // url for an assets flag icon
  late String url; // the location url for api endpoint
  late bool isDayTime; // true or false if day time or not.

  WorldTime(this.location, this.flag, this.url);


  Future<void> getTime() async {
    late Response response;
    try{
      response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

    }
    catch(e){
      print("error: $e");
      time = 'coudnt get time';
      return ;
    }
    Map data = jsonDecode(response.body);
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);


    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
    time = DateFormat.jm().format(now);// set the time property



  }



}
