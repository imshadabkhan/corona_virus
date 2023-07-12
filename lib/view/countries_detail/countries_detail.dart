import 'package:flutter/material.dart';

import '../countries_stats/widgets/countries_stats_widgets.dart';

class Countries_Detail extends StatefulWidget {
  Countries_Detail(
      {required this.name,
      required this.deaths,
      required this.recovered,
      required this.critical,
      required this.cases,
      required this.image});
  String name;
  int deaths;
  int recovered;
  int critical;
  int cases;
  var image;

  @override
  State<Countries_Detail> createState() => _Countries_DetailState();
}

class _Countries_DetailState extends State<Countries_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        SizedBox(height: 18),
                        Reuseable_Row(
                          title: "Deaths",
                          value: widget.deaths.toString(),
                        ),
                        Reuseable_Row(
                          title: "Recovered",
                          value: widget.cases.toString(),
                        ),
                        Reuseable_Row(
                          title: "Critical",
                          value: widget.critical.toString(),
                        ),
                        Reuseable_Row(
                          title: "Cases",
                          value: widget.recovered.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 230.0),
            child: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              radius: 50,
              backgroundImage: NetworkImage(
                widget.image,
              ),
            ),
          )
        ],
      ),
    );
  }
}
