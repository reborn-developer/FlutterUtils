import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_exercise/widget/actionSheet_widget.dart';
import 'package:photo/photo.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:image_picker/image_picker.dart';

/// 相册、相机工具类
class PickerImageUtils {

  final List<String> paths; // 用于上传
  final List<File> files;   // 用于展示用的缩略图

  PickerImageUtils({this.paths, this.files});
}

/// 打开相册拍照选择框
void Function(BuildContext, int, Function(PickerImageUtils))
pickImageFromCameraOrAlbum =
    (BuildContext context, int rest, Function(PickerImageUtils) callback) {
  bottomSheet(
      context,
      // 多张
      CupertinoActionSheetWidget (
          items: ['拍照', '相册'],
          callback: (int idx) async {
            if (idx == 0) return callback(await openCamera());
            return callback(await pickImageFromAlbum(context, rest));
          }));
      // 单张
      // CupertinoActionSheetWidget (
      //     items: ['拍照', '相册'],
      //     callback: (int idx) async {
      //       if (idx == 0) return callback(await openCamera());
      //       return callback(await pickImage());
      //     }));
  return;
};

/// 打开相机
Future<PickerImageUtils> Function() openCamera = () async {

  final ImagePicker picker = ImagePicker();

  final PickedFile img = await picker.getImage(source: ImageSource.camera);
  if (img.path == null) return PickerImageUtils();
  return PickerImageUtils(paths: [img.path], files: [File(img.path)]);
};

/// 选择相册多张图片
Future<PickerImageUtils> Function(BuildContext, int) pickImageFromAlbum =
    (BuildContext context, int rest) async {
  List<AssetEntity> imgList = await PhotoPicker.pickAsset(
    context: context,
    themeColor: Color(0xff00c295),
    textColor: Colors.white,
    padding: 1.0,
    dividerColor: Colors.grey,
    disableColor: Colors.grey.shade300,
    itemRadio: 0.88,
    maxSelected: rest,
    provider: I18nProvider.chinese,
    rowCount: 3,
    thumbSize: 150,
    sortDelegate: SortDelegate.common,
    checkBoxBuilderDelegate: DefaultCheckBoxBuilderDelegate(
      activeColor: Colors.white,
      unselectedColor: Colors.white,
      checkColor: Color(0xff00c295),
    ),
    badgeDelegate: DurationBadgeDelegate(),
    pickType: PickType.onlyImage,
  );
  if (imgList == null || imgList.isEmpty) return PickerImageUtils();

  List<String> r = [];
  List<File> f = [];
  for (var e in imgList) {
    var file = await e.file;
    f.add(file);
    r.add(file.absolute.path);
  }
  return PickerImageUtils(paths: r, files: f);
};

/// 选择相册单张图片
Future<PickerImageUtils> Function() pickImage = () async {
  final ImagePicker picker = ImagePicker();

  final PickedFile img = await picker.getImage(source: ImageSource.gallery);
  if (img.path == null) return PickerImageUtils();
  return PickerImageUtils(paths: [img.path], files: [File(img.path)]);
};