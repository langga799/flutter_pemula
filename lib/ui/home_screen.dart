import 'package:flutter/material.dart';import 'package:flutter_pemula/ui/detail_screen.dart';import '../model/cars_collection.dart';class HomeScreen extends StatelessWidget {  const HomeScreen({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(        backgroundColor: Colors.black87,        title: const Text('Cars Collection'),      ),      body: LayoutBuilder(          builder: (BuildContext context, BoxConstraints constraints) {        if (constraints.maxWidth <= 600) {          return const CarsCollectionList();        } else if (constraints.maxWidth <= 1200) {          return const CarsCollectionGrid(gridCount: 4);        } else {          return const CarsCollectionGrid(gridCount: 6);        }      }),    );  }}class CarsCollectionGrid extends StatelessWidget {  final int gridCount;  const CarsCollectionGrid({Key? key, required this.gridCount})      : super(key: key);  @override  Widget build(BuildContext context) {    return Padding(      padding: const EdgeInsets.all(24.0),      child: GridView.count(          crossAxisCount: gridCount,          crossAxisSpacing: 8,          mainAxisSpacing: 16,          children: listCars.map((cars) {            return InkWell(              onTap: () {                Navigator.push(context, MaterialPageRoute(builder: (context) {                  return DetailScreen(carsCollections: cars);                }));              },              child: Card(                child: Column(                  crossAxisAlignment: CrossAxisAlignment.stretch,                  children: [                    Expanded(                      child: Image.asset(                        cars.imageAssets,                        fit: BoxFit.cover,                      ),                    ),                    const SizedBox(height: 8),                    Padding(                      padding: const EdgeInsets.only(left: 8.0),                      child: Text(                        cars.name,                        style: const TextStyle(                          fontSize: 16.0,                          fontWeight: FontWeight.bold,                        ),                      ),                    ),                    Padding(                      padding: const EdgeInsets.only(left: 8.0),                      child: Text(                        'Rating : ${cars.rating}',                      ),                    ),                    Padding(                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),                      child: Text(                        'Description : ${cars.description}',                        overflow: TextOverflow.ellipsis,                      ),                    ),                  ],                ),              ),            );          }).toList()),    );  }}class CarsCollectionList extends StatelessWidget {  const CarsCollectionList({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return ListView.builder(      itemBuilder: (context, index) {        final CarsCollections carsCollections = listCars[index];        return InkWell(          onTap: () {            Navigator.push(context, MaterialPageRoute(builder: (context) {              return DetailScreen(carsCollections: carsCollections);            }));          },          child: Card(            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),            child: Row(              crossAxisAlignment: CrossAxisAlignment.start,              children: <Widget>[                Expanded(                  flex: 1,                  child: Image.asset(                    carsCollections.imageAssets,                    fit: BoxFit.cover,                    height: 100,                  ),                ),                Expanded(                  flex: 2,                  child: Padding(                    padding: const EdgeInsets.all(8.0),                    child: Column(                      crossAxisAlignment: CrossAxisAlignment.start,                      mainAxisSize: MainAxisSize.min,                      children: <Widget>[                        Text(                          carsCollections.name,                          overflow: TextOverflow.ellipsis,                          style: const TextStyle(                              fontSize: 16.0, fontWeight: FontWeight.bold),                        ),                        const SizedBox(                          height: 8,                        ),                        Text('Rating : ${carsCollections.rating}'),                        Text('Description : ${carsCollections.description}',                            overflow: TextOverflow.ellipsis),                      ],                    ),                  ),                ),              ],            ),          ),        );      },      itemCount: listCars.length,    );  }}