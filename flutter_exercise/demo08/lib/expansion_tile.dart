import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expansion tile demo')),
      body: Center(
        child: ExpansionTile(
          title: Text('Expansion Tile'),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white,
          children: [
            ListTile(
              title: Text('list tile'),
              subtitle: Text('subtitle'),
            ),
          ],
          // initiallyExpanded: true,
        ),
      ),
    );
  }
}
