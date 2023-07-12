import 'package:corona_virus/models/Covid_Stats_Model.dart';
import 'package:corona_virus/services/utilities/states_services.dart';
import 'package:corona_virus/view/countries_stats/widgets/countries_stats_widgets.dart';
import 'package:corona_virus/view/countrieslist/countries_wise.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Countries_Stats extends StatefulWidget {
  const Countries_Stats({Key? key}) : super(key: key);

  @override
  State<Countries_Stats> createState() => _Countries_StatsState();
}


class _Countries_StatsState extends State<Countries_Stats> with TickerProviderStateMixin {

  late final AnimationController _controller =
  AnimationController(vsync: this, duration: Duration(seconds: 3))
    ..repeat();
  void dispose(){
    super.dispose();
    _controller.dispose();
  }




  final colorList = [
    Colors.deepOrangeAccent,
    Colors.lightGreenAccent,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    FetchData fetchData=FetchData();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            FutureBuilder(
                future: fetchData.fetchWorldsStatsServices(),
                builder: (BuildContext context,AsyncSnapshot<CovidStatsModel> snapshot){
              if(!snapshot.hasData){
                return Expanded(
                    flex: 1,
                    child:SpinKitFadingCircle(
                   color: Colors.white,
                  size: 50,
                      controller: _controller,
              ));

              }else{
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 20),
                    child: PieChart(
                      dataMap:  <String, double>{
                        "Total": double.parse(snapshot.data!.cases!.toString()),
                        "Recovered": double.parse(snapshot.data!.recovered!.toString()),
                        "Deaths": double.parse(snapshot.data!.deaths!.toString()),
                        "Serious": double.parse(snapshot.data!.critical!.toString()),
                      },
                      animationDuration: Duration(seconds: 2),
                      chartType: ChartType.ring,
                      baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                      colorList: colorList,
                      legendOptions: LegendOptions(
                        legendPosition: LegendPosition.left,
                      ),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValuesInPercentage: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    color: Colors.red,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                      child: Column(
                        children: [
                          Reuseable_Row(title: "Total", value:  snapshot.data!.cases!.toString(),),
                          Reuseable_Row(title: "Recovered", value: snapshot.data!.recovered!.toString(),),
                          Reuseable_Row(title: "Deaths", value: snapshot.data!.deaths!.toString(),),
                          Reuseable_Row(title: "Serious", value: snapshot.data!.critical!.toString(),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Countries_List()));
                    },
                    child: Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                            "Track Countries",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),

                ],);


              }



            }),



          ],
        ),
      ),
    );
  }
}
