import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http; // as http....this is instruction fro include package in website
import 'dart:convert';

import 'package:jai_app/models/food_model.dart';
import 'package:jai_app/screens/detail.dart'; // change json message to be readable

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// Explicit

  List<FoodModel> foodModels =
      []; //use FoodModel as datatype declare for List object

// Method

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    String urlJSON = 'https://www.androidthai.in.th/ooo/getAllFood.php';

    var response = await http.get(urlJSON);
    var result = json.decode(response.body);
    //print('result = $result');

    for (var myParseJSON in result) {
      setState(() {
        //setState is for whenever ready single record...then display..don't need to complete all
        FoodModel foodModel = FoodModel.fromJSon(myParseJSON);
        foodModels.add(foodModel);
        //print('name = ${foodModel.nameFood}'); //use {} around variable because foodModel is object
      });
    }
  }

  Widget showFoodListView() {
    return ListView.builder(
      itemCount: foodModels.length,
      itemBuilder: (BuildContext context, int index) {
        //return Text(foodModels[index].nameFood);
        return GestureDetector(
          child: Container(
            child: Row(
              children: <Widget>[
                showImage(index),
                showText(index),
              ],
            ),
          ),
          onTap: () {
            var detailRoute = MaterialPageRoute(
                builder: (BuildContext context) => Detail(
                      foodModel: foodModels[index],
                    ));
            Navigator.of(context).push(detailRoute);
          },
        );
      },
    ); //ListView.builder is used when we use array....different from ListView from previous example
  }

  Widget showText(int index) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(foodModels[index].nameFood),
          Text(foodModels[index].priceFood),
        ],
      ),
    );
  }

  Widget showImage(int index) {
    return Container(
      width: 180.0,
      height: 120.0,
      child: Image.network(foodModels[index].imageFood),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showFoodListView(),
    );
  }
}
