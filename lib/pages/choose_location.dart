import 'package:flutter/material.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter  = 0;

  @override
  void initState() {
    super.initState();
    print('init state run');
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
      body: TextButton(
        onPressed: (){
          setState(() {
            counter += 1;
          });

        },
        child: Text('$counter'),
      ),

    );
  }
}
