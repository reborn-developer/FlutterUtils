import 'package:flutter/material.dart';

class ExpansionPaneListDemo extends StatefulWidget {
  @override
  _ExpansionPaneListDemoState createState() => _ExpansionPaneListDemoState();
}

class _ExpansionPaneListDemoState extends State<ExpansionPaneListDemo> {

  List<int> mList;
  List<ExpandStateBean> expandStateList;

  _ExpansionPaneListDemoState(){
    mList = new List();
    expandStateList = new List();
    for(int i = 0; i<10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(false, i));
    }
  }

  _setCurrentIndex(int index, isExPand){
    setState(() {
      expandStateList.forEach((item) {
        if(item.index == index) {
          item.isOpen = !isExPand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('expansion panel list')),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol){
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index){
            return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text('This is No.${index}'),
                );
              },
              body: ListTile(
                title: Text('expansion no.${index}'),
              ),
              isExpanded: expandStateList[index].isOpen,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean(this.isOpen, this.index);
}
