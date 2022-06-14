import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

PermissionStatus? permissions;
PermissionStatus? permissions1;

class CheckPermissionForImagePicker extends StatelessWidget {
  final String name;
  final IconData icon;
  final ValueSetter<File> imageFile;

  const CheckPermissionForImagePicker(
      {Key? key,
      required this.name,
      required this.icon,
      required this.imageFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(icon),
        title: Text(name),
        onTap: () async {
          if (name == 'Camera') {
            if (await Permission.camera.isGranted) {
              _openImagePicker(ImageSource.camera, context);
            } else if (await Permission.camera.request().isGranted) {
              _openImagePicker(ImageSource.camera, context);
            } else {
              permissions = await Permission.camera.request();
              if (permissions!.isGranted) {
                _openImagePicker(ImageSource.camera, context);
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                            title: const Text('Camera Permission'),
                            content: const Text(
                                'This app needs camera access to take pictures for upload user profile photo'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                  child: const Text('Deny'),
                                  onPressed: () => Navigator.of(context).pop()),
                              CupertinoDialogAction(
                                  child: const Text('Settings'),
                                  onPressed: () => openAppSettings())
                            ]));
              }
            }
          } else if (name == 'Photo Gallery with Image Picker') {
            if (await Permission.photos.isGranted) {
              _openImagePicker(ImageSource.gallery, context, fromGallery: true);
            } else if (await Permission.photos.request().isGranted) {
              _openImagePicker(ImageSource.gallery, context, fromGallery: true);
            } else {
              await Permission.photos.request();
              if (await Permission.photos.request().isGranted) {
                _openImagePicker(ImageSource.gallery, context,
                    fromGallery: true);
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                            title: const Text('Gallery Permission'),
                            content: const Text(
                                'This app needs gallery access to select pictures for upload user profile photo'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                  child: const Text('Deny'),
                                  onPressed: () => Navigator.of(context).pop()),
                              CupertinoDialogAction(
                                  child: const Text('Settings'),
                                  onPressed: () => openAppSettings())
                            ]));
              }
            }
          }
        });
  }

  Future _openImagePicker(ImageSource source, BuildContext context,
      {bool fromGallery = false}) async {
    try {
      final _file = await ImagePicker().pickImage(
          source: source, maxHeight: 400, maxWidth: 400, imageQuality: 80);
      if (_file != null) {
        imageFile(File(_file.path));
      }
    } on PlatformException catch (e) {
      debugPrint('Unsupported operation' + e.toString());
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      Navigator.pop(context);
    }
  }
}
