import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ova/formdata/imagepiker/imagepiker1.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Piechart extends StatefulWidget {
  @override
  State<Piechart> createState() => _PiechartState();
}

class _PiechartState extends State<Piechart> {
  int choiceIndex = 0;
  List pie = [];
  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  void fetchdata() async {
    var url = "https://vstechno.co.in/news/api/user.php?action=countvote";
    print("!!!!!!!!!!!!!$url");
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var item = jsonDecode(response.body)['vote'];
      print(item);
      setState(() {
        pie = item;
        storage.write('bjp', pie[0]['countparty']);
        storage.write('INC', pie[1]['countparty']);
        storage.write('AAP', pie[2]['countparty']);
        storage.write('SP', pie[3]['countparty']);
        storage.write('NOTA', pie[4]['countparty']);
      });
    } else {
      setState(() => pie = []);
    }
  }

  Map<String, double> datamap = {
    "Bjp": double.parse(storage.read('bjp')),
    "INC": double.parse(storage.read('INC')),
    "APP": double.parse(storage.read('AAP')),
    "SP": double.parse(storage.read('SP')),
    "NOTA": double.parse(storage.read('NOTA')),
  };
  List<Color> colorList = [
    const Color(0xFFd35400),
    const Color(0xFF229954),
    const Color(0xFFf4d03f),
    const Color(0xFF45b39d),
    const Color(0xFF5dade2),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Color(0xFF2F2E4D), title: Text("chart".tr)),
      body: Center(
          child: PieChart(
        chartLegendSpacing: 2,
        chartRadius: 450,
        animationDuration: Duration(seconds: 2),
        dataMap: datamap,
        colorList: colorList,
        centerText: "chart1".tr,
      )),
    );
  }
}
