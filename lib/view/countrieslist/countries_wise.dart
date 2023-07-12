import 'package:corona_virus/services/utilities/states_services.dart';
import 'package:corona_virus/view/countries_detail/countries_detail.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Countries_List extends StatefulWidget {
  const Countries_List({Key? key}) : super(key: key);

  @override
  State<Countries_List> createState() => _Countries_ListState();
}

class _Countries_ListState extends State<Countries_List> {
  final _searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FetchData fetchData = FetchData();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _searchBarController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(80),
                ),
                hintText: "search countries here",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 25),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: FutureBuilder(
                future: fetchData.countriesStats(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey,
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                              ),
                              title: Container(
                                  height: 10, width: 30, color: Colors.white),
                              subtitle: Container(
                                height: 10,
                                width: 80,
                                color: Colors.white,
                              ),
                            ),
                          );
                        });
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['country'];
                          if (_searchBarController.text.isEmpty) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Countries_Detail(
                                                  image: snapshot.data![index]['countryInfo']['flag'],
                                                  name: snapshot.data![index]
                                                      ['country'],
                                                  deaths: snapshot.data![index]
                                                      ['deaths'],
                                                  recovered:
                                                      snapshot.data![index]
                                                          ['recovered'],
                                                  critical: snapshot
                                                      .data![index]['critical'],
                                                  cases: snapshot.data![index]
                                                      ['cases'],
                                                )));
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(
                                        snapshot.data![index]['countryInfo']
                                            ['flag'],
                                      ),
                                    ),
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['updated']
                                        .toString()),
                                  ),
                                ),
                              ],
                            );
                          } else if (name.toLowerCase().contains(
                              _searchBarController.text.toLowerCase())) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                      snapshot.data![index]['countryInfo']
                                          ['flag'],
                                    ),
                                  ),
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]
                                          ['updated']
                                      .toString()),
                                ),
                              ],
                            );
                          } else {
                            Container();
                          }
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
