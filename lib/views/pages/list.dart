import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/coffee.dart';
import 'package:flutter_application_1/views/pages/listdetail.dart';

class ListPage extends StatelessWidget {
  var _ctx = null;
  var _data = [
    Coffee('1.jpg', 'Aceh Gayo Anaerob Natural 200g Kopi Arabica', 85000),
    Coffee('2.jpg', 'Aceh Gayo Atu Lintang 200g Kopi Arabica', 65000),
    Coffee('3.jpg', 'Aceh Gayo Honey Process 200g Kopi Arabica', 85000),
    Coffee('4.jpg', 'Bali Honey Process 200g Kopi Arabica', 95000),
    Coffee('5.jpg', 'Bali Kintamani 200g Kopi Arabica', 75000),
    Coffee('6.jpg', 'Espresso House Blend 200g Kopi Arabica', 85000)
  ];

  void _onPressed(Coffee c) {
    Navigator.push(_ctx, MaterialPageRoute(builder: (builder) {
      return ListDetailPage((c.img), c.name, c.price);
    }));
  }

  Widget _buildWidget(Coffee c) {
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 44,
            minWidth: 44,
            maxHeight: 64,
            minHeight: 64,
          ),
          child: Image.asset(
            'assets/${c.img}',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(c.name),
        trailing: ElevatedButton(
          child: Text('Details'),
          onPressed: () => _onPressed(c),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return ListView(
      children: _data.map((e) => _buildWidget(e)).toList(),
    );
  }
}
