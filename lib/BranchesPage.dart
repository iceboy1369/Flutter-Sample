import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:sample/Branch.dart';

class BranchesPage extends StatefulWidget {
  const BranchesPage({super.key});
  @override
  State<BranchesPage> createState() => _BranchesPageState();
}

class _BranchesPageState extends State<BranchesPage> {

  late MapboxMapController mapController;
  Set<Symbol> symbolList={};

  Future<Uint8List> loadMarkerImage() async {
    var byteData = await rootBundle.load('assets/images/marker.png');
    return byteData.buffer.asUint8List();
  }

  void _onMapCreated(MapboxMapController controller)async {
    mapController = controller;

    var markerImage = await loadMarkerImage();
    await controller.addImage('marker2', markerImage);
  }

  @override
  void initState() {
    super.initState();
    fetchPoints();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "فروشگاه آنلاین",
          style: TextStyle(
              color: Colors.black45,
              fontFamily: "IRANSans"
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: MapboxMap(
        accessToken: 'pk.eyJ1IjoiaWNlYm95NjkiLCJhIjoiY2sxZHg0YWQ4MGF3ZjNkbWRrNWEydnZxYiJ9.S1rsWcaOYRTbjZ2WdoqFkQ',
        onMapCreated: _onMapCreated,
        onStyleLoadedCallback: ()=> addCircle(mapController),
        initialCameraPosition: const CameraPosition(
          target: LatLng(32.605599, 54.165450),
          zoom: 4,
        ),
      ),
    );
  }

  void addCircle(MapboxMapController mapController)async{
    for(var symbol in symbolList) {

      // Circle circle = Circle(
      //     symbol.id.toString(),
      //     CircleOptions(
      //         geometry: LatLng(symbol.options.geometry!.latitude,symbol.options.geometry!.longitude),
      //         circleColor: '#23d2aa',
      //         circleRadius: 10
      //     )
      // );
      // mapController.addCircle(circle.options);


      mapController.addSymbol(symbol.options);
      mapController.onSymbolTapped.add((argument) =>
        print(argument.options.textAnchor.toString())
      );
    }
  }

  void fetchPoints() async{
    var branchesJson = json.decode('[]');

    var dio = Dio(
        BaseOptions(
          contentType: 'application/json',
          responseType: ResponseType.plain,
        )
    );

    try{
      var response = await dio.get('http://www.welearnacademy.ir/flutter/branches.json');
      branchesJson = json.decode(response.data);
    }catch(exception){
      branchesJson = json.decode('[{"shop_name": "فروشگاه کاظمی", "id":1, "tel":"09159109704", "lat":32.689602, "lng":51.655582, "manager":"محمدی"}]');
    }

    setState(() {
      for(var branch in branchesJson){
        var branchItem = Branch(branch['shop_name'], branch['id'], branch['tel'], branch['lat'], branch['lng'], branch['manager']);
        Symbol symbol = Symbol(
            branchItem.id.toString(),
            SymbolOptions(
              textAnchor: branch.toString(),
              geometry: LatLng(branchItem.lat, branchItem.lng) ,
              iconImage: 'marker2',
              iconSize: 0.05,
            )
        );
        symbolList.add(symbol);
      }
    });
  }
}