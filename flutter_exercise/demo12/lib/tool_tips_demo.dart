import 'package:flutter/material.dart';

class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tool tips demo')),
      body: Center(
        child: Tooltip(
          message: '是你吗，哆啦A梦',
          child: Image.network('https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F201907%2F20%2F20190720211732_ufzek.thumb.400_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1614409388&t=9bea60b4e1b2e725d019570855c519cc'),
        ),
      ),
    );
  }
}
