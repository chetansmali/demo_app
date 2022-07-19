import 'package:flutter/material.dart';
import 'package:demo_app/services/World_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'thanos.jpeg', url: 'Europe/Berlin');
    await  instance.getTime();
    //Navigate to home screen and carrying local instance
    Navigator.pushReplacementNamed(context, '/home',arguments: {
    'location': instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 60.0,
        ),

      ),
    );
  }
}
