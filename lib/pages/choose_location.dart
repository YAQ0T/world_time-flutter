import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter  = 0;



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
      body: Column(
        children: [TextButton(
          onPressed: (){
            setState(() {
              counter += 1;
            });

          },
          child: Text('$counter'),
        ),
          const Center(
            child: const SpinKitRotatingCircle(
              color: Colors.white,
              size: 80.0,
            ),
          ),
        ]
      ),

    );
  }
}
