import 'package:flutter/material.dart';

class App {
  Widget cards({
    required List<Widget> column,
    required double height,
  }) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Card(
          color: const Color(0xFF627192),
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(children: column),
        ),
      ),
    );
  }

  Widget can(
      {required BuildContext context,
      required String text1,
      required String text2,
      required String text3,
      required String text4,
      required VoidCallback onTap,
      Color color = Colors.blue,
      required var photo}) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: hight / 6,
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.black)),
          child: Row(
            children: [
              SizedBox(
                height: 115,
                width: width / 4.1,
                child: Image.asset(photo, fit: BoxFit.fill),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(20)),
                    ),
                    height: 30,
                    width: 272,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text1,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Text(text2, style: TextStyle(fontSize: 15.5)),
                  const SizedBox(
                    width: 5,
                    child: Divider(thickness: 1, color: Colors.black),
                  ),
                  Text(text3),
                  const SizedBox(
                    width: 270,
                    child: Divider(thickness: 1, color: Colors.black),
                  ),
                  Text(text4),
                  SizedBox(height: 9),
                ],
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
