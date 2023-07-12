import 'dart:async';

import 'package:corona_virus/view/countries_stats/countries_stats.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Timer(Duration(seconds: 5), () {Navigator.push(context, MaterialPageRoute(builder:(context)=>Countries_Stats(),),);});
  }

  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              child: Center(
                  child: Container(



                height: MediaQuery.of(context).size.height*0.2,
                width:  MediaQuery.of(context).size.height*0.2,
                child: Image(image: AssetImage('assets/images/virus.png'),fit: BoxFit.fill,),
              )),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 500.0 * math.pi,
                  child: child,
                );
              }),
          SizedBox(height: 80,),
          Align(
              alignment:Alignment.center ,
              child: Text('Covid 19 \n Tracker App',textAlign:TextAlign.center,style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 25),)),
        ],
      ),
    );
  }
}
