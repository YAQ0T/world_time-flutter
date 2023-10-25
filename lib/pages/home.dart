import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)! .settings.arguments as Map;

    String bgImage = data['isDayTime'] ? 'daytime.png' : 'night time.png';


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
            'images/$bgImage'
          ),
            fit: BoxFit.cover,
          )
        ),
        child: SafeArea(
          child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async{
                  dynamic results = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time' : results['time'],
                      'location' : results['location'],
                      'isDayTime' : results['isDayTime'],
                      'flag' : results['flag'],
                    };
                  });
                },
                icon:  Icon(Icons.edit_location
                ,color: Colors.grey[300],),
                label:  Text('Edit Location',
                style: TextStyle(
                  color: Colors.grey[300],
                ),)),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                    color: Colors.white
                  ),
              ),

          ]
            ,
          ),
        ),

        ),
      ),

    );
  }
}

