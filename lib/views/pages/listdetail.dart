import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDetailPage extends StatelessWidget {
  String img;
  String name;
  int price;

  ListDetailPage(this.img, this.name, this.price);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${name} Details'),
        ),
        body: Center(
          child: Column(
            children: [Image(image: AssetImage('assets/${img}')), Text(name)],
          ),
        ));
  }
}
