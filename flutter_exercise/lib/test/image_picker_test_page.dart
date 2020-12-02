import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_exercise/utils/pick_image_utils.dart';
import 'package:flutter_exercise/widget/my_app_bar.dart';

/// 相册组件测试页面
class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickPageState createState() => _ImagePickPageState();
}

class _ImagePickPageState extends State<ImagePickerPage> {
  List<File> imgList = [];
  List<String> imgPaths = [];
  File urlFile;

  @override
  void initState() {
    super.initState();
  }

  selectImage() {
    pickImageFromCameraOrAlbum(context, 3 - imgList.length, (PickerImageUtils r) {
      if (r.files != null) {
        imgList.addAll(r.files);
      }

      if (r.paths != null) {
        imgPaths.addAll(r.paths);
      }

      setState(() {
        urlFile = imgList.last;

      });

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyAppBar(myTitle: "相册测试页"),
      // body: _ImageView(imgList[0]),
      body: Column(
        children: [
          _ImageView(),
          FlatButton(
            onPressed: selectImage,
            color: Colors.blue,
            child: Text("去拍照"),
            // colorBrightness: Brightness.dark,
          )
        ],
      ),
    );
  }

  Widget _ImageView() {

    if (urlFile == null) {
      return Center(
        child: Text("没有图片"),
      );
    } else {
      return Container(
        height: 300.0,
        width: 300.0,
        margin: EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.all(Radius.circular(8.0)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: FileImage(
              urlFile,
            ),
          ),
          color: Color(0xFFF0F0F0),
        ),
      );
    }
  }
}