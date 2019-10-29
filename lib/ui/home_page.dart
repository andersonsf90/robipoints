import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:robi_points_weightlifting/enums/genre.dart';
import 'package:robi_points_weightlifting/helpers/robi_points.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GenreCharacter _genreCharacter = GenreCharacter.male;

  List<DropdownMenuItem<int>> listDrop = [
    (DropdownMenuItem(
      child: Text("55 kg"),
      value: 1,
    )),
    (DropdownMenuItem(
      child: Text("61 kg"),
      value: 2,
    )),
    (DropdownMenuItem(
      child: Text("67 kg"),
      value: 3,
    )),
    (DropdownMenuItem(
      child: Text("73 kg"),
      value: 4,
    )),
    (DropdownMenuItem(
      child: Text("81 kg"),
      value: 5,
    )),
    (DropdownMenuItem(
      child: Text("89 kg"),
      value: 6,
    )),
    (DropdownMenuItem(
      child: Text("96 kg"),
      value: 7,
    )),
    (DropdownMenuItem(
      child: Text("102 kg"),
      value: 8,
    )),
    (DropdownMenuItem(
      child: Text("109 kg"),
      value: 9,
    )),
    (DropdownMenuItem(
      child: Text("109+ kg"),
      value: 10,
    ))
  ];

  int weightCategorySelected = null;

  TextEditingController weightController = TextEditingController();

  String _infoText = "Put your data!";

  RobiPoints robiPoints = RobiPoints();

  void _resetFields() {
    weightController.text = "";
    weightCategorySelected = null;
    _genreCharacter = GenreCharacter.male;
    loadDataListMen();
    _infoText = "Put your data!";
    setState(() {});
  }

  void _calculate() {
    double weight = double.parse(weightController.text);
    int CategorySelected = weightCategorySelected;
    String genre = _genreCharacter.toString();
    print("$weight --- $CategorySelected --- $genre");

    double totalPoints = robiPoints.calculate(genre, CategorySelected, weight);
    _infoText = ("You made $totalPoints points.");
    setState(() {});
  }

  void loadDataListMen() {
    listDrop = [];
    listDrop.add(DropdownMenuItem(
      child: Text("55 kg"),
      value: 1,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("61 kg"),
      value: 2,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("67 kg"),
      value: 3,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("73 kg"),
      value: 4,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("81 kg"),
      value: 5,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("89 kg"),
      value: 6,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("96 kg"),
      value: 7,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("102 kg"),
      value: 8,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("109 kg"),
      value: 9,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("109+ kg"),
      value: 10,
    ));
  }

  void loadDataListWomen() {
    listDrop = [];
    listDrop.add(DropdownMenuItem(
      child: Text("45 kg"),
      value: 1,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("49 kg"),
      value: 2,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("55 kg"),
      value: 3,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("59 kg"),
      value: 4,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("64 kg"),
      value: 5,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("71 kg"),
      value: 6,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("76 kg"),
      value: 7,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("81 kg"),
      value: 8,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("87 kg"),
      value: 9,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("87+ kg"),
      value: 10,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Robi Points",
            style: TextStyle(fontSize: 32.0),
          ),
          backgroundColor: Colors.amber,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _resetFields();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
          child: Container(
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Genre",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 28.0,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        value: GenreCharacter.male,
                        groupValue: _genreCharacter,
                        //activeColor: Colors.white,
                        onChanged: (GenreCharacter value) {
                          loadDataListMen();
                          setState(() {
                            _genreCharacter = value;
                          });
                        },
                      ),
                      Text(
                        "Male",
                        style: TextStyle( fontSize: 24.0),
                      ),
                      Radio(
                        value: GenreCharacter.female,
                        groupValue: _genreCharacter,
                        //activeColor: Colors.white,
                        onChanged: (GenreCharacter value) {
                          //_resetFields();
                          loadDataListWomen();
                          setState(() {
                            _genreCharacter = value;
                          });
                        },
                      ),
                      Text(
                        "Female",
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ]),
                Text(
                  "Weight Category",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 28.0,
                  ),
                ),
                 DropdownButton(
                  value: weightCategorySelected,
                  isExpanded: true,
                  iconSize: 40.0,
                  style: TextStyle(fontSize: 24.0),
                  items: listDrop,
                  hint: Text("Select Category"),
                  onChanged: (value) {
                    weightCategorySelected = value;
                    setState(() {});
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso (Kg)",
                      labelStyle: TextStyle(color: Colors.amber)),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0),
                  controller: weightController,
                ),
                RaisedButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                  color: Colors.amber,
                  onPressed: () {
                    _calculate();
                  },
                ),
                Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 24.0,
                  ),
                ),
              ],
            )),
          ),
        ));
  }
}
