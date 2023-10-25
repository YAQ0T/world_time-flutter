import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/World_Time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter  = 0;

  //set background
  List<WorldTime> locations = [
    WorldTime('Palestine', 'palestine.png', 'Asia/Hebron'),
    WorldTime('London', 'uk.png', 'Europe/London'),
    WorldTime('Athens', 'greece.png', 'Europe/Berlin'),
    WorldTime('Cairo', 'egypt.png', 'Africa/Cairo'),
    WorldTime('Nairobi', 'kenya.png', 'Africa/Nairobi'),
    WorldTime('Chicago', 'usa.png', 'America/Chicago'),
    WorldTime('New York', 'usa.png', 'America/New_York'),
    WorldTime('Seoul', 'south_korea.png', 'Asia/Seoul'),
    WorldTime('Jakarta', 'indonesia.png', 'Asia/Jakarta'),
  ];
  void updateTime(index) async{
        WorldTime instance = locations[index];
        await instance.getTime();
        Navigator.pop(context, {
            'location' : instance.location,
            'flag': instance.flag,
            'time': instance.time,
            'isDayTime': instance.isDayTime,
        });

  }

  @override
  Widget build(BuildContext context) {
    print('build state run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose a Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
      );

  }
}
