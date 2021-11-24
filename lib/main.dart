import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "learn statefull",
    home: FavoriteCity(),
  ));
}

class FavoriteCity extends StatefulWidget {
  const FavoriteCity({Key? key}) : super(key: key);

  @override
  _FavoriteCityState createState() => _FavoriteCityState();
}

class _FavoriteCityState extends State<FavoriteCity> {
  String nameCity = "";
  var money = ["rupiah", "dollar", "euro"];
  var currentItemSelected = 'rupiah';
  @override
  Widget build(BuildContext context) {
    debugPrint("widget created");
    return Scaffold(
      appBar: AppBar(
        title: Text("StatefullApp"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (String userInput) => setState(() {
                debugPrint("set stated running");
                nameCity = userInput;
              }),
            ),
            DropdownButton<String>(
              items: money.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (var newValueSelected) {
                _dropDownItemSelected(newValueSelected);
              },
              value: currentItemSelected,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                " Your city name is $nameCity",
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _dropDownItemSelected(var newValueSelected) {
    setState(() {
      this.currentItemSelected = newValueSelected;
    });
  }
}
