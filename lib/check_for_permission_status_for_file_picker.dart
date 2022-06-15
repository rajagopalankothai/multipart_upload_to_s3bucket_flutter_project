import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';

PermissionStatus? permissions;

class CheckPermissionForFilePicker extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool multipleUpload;
  final ValueSetter<File> imageFile;
  final ValueSetter<List<File>> imageFileList;

  const CheckPermissionForFilePicker(
      {Key? key,
      required this.name,
      required this.icon,
      required this.imageFile,
      required this.multipleUpload,
      required this.imageFileList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Icon(icon),
        title: Text(name),
        onTap: () async {
          if (await Permission.photos.isGranted) {
            _openFilePicker(context);
          } else if (await Permission.photos.request().isGranted) {
            _openFilePicker(context);
          } else {
            await Permission.photos.request();
            if (await Permission.photos.request().isGranted) {
              _openFilePicker(context);
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
        });
  }

  Future _openFilePicker(BuildContext context) async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: multipleUpload);
      if (result != null) {
        List<File> files = result.paths.map((path) => File(path!)).toList();
        if (multipleUpload) {
          imageFileList(files);
        } else {
          imageFile(files.first);
        }
      }
    } on PlatformException catch (e) {
      debugPrint('Unsupported operation' + e.toString());
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      // Navigator.pop(context);
    }
  }
}
