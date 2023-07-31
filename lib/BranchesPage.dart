import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class BranchesPage extends StatefulWidget {
  const BranchesPage({super.key});

  @override
  State<BranchesPage> createState() => _BranchesPageState();
}

class _BranchesPageState extends State<BranchesPage> {
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
        initialCameraPosition: const CameraPosition(target: LatLng(0.0,0.0)),
      )
    );
  }
}