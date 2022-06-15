import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_presigned_url/check_for_permission_status_for_file_picker.dart';
import 'package:flutter_presigned_url/check_for_permission_status_for_image_picker.dart';
import 'package:flutter_presigned_url/connector/auth_connector.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<File> _selectedFileFromCamera = [];
  List<File> _selectedFileFromGallery = [];
  List<File> _selectedFileFromSinglePick = [];
  List<File> _selectedFileFromMultiplePick = [];

  @override
  Widget build(BuildContext context) {
    return AuthConnector(
        builder: (BuildContext context, AuthViewModel authViewModel) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CheckPermissionForImagePicker(
                    name: 'Photo Gallery with Image Picker',
                    icon: Icons.photo_library,
                    imageFile: (dynamic value) {
                      if (value != null && mounted) {
                        setState(() {
                          _selectedFileFromGallery.add(value);
                        });
                        // authViewModel.uploadAttachmentToBucket(
                        //     value?.path.split('/').last,
                        //     File(value!.path),
                        //     (String? url) {});
                      }
                    }),
                CheckPermissionForImagePicker(
                    name: 'Camera',
                    icon: Icons.photo_camera,
                    imageFile: (dynamic value) {
                      if (value != null && mounted) {
                        setState(() {
                          _selectedFileFromCamera.add(value);
                        });
                      }
                    }),
                CheckPermissionForFilePicker(
                    name: 'Image Library with File Picker (Single)',
                    icon: Icons.photo_library,
                    multipleUpload: false,
                    imageFileList: (dynamic value) {},
                    imageFile: (dynamic value) {
                      if (value != null && mounted) {
                        setState(() {
                          _selectedFileFromSinglePick.add(value);
                        });
                      }
                    }),
                CheckPermissionForFilePicker(
                    name: 'Image Library with File Picker (Multiple)',
                    icon: Icons.photo_library,
                    multipleUpload: true,
                    imageFileList: (dynamic value) {
                      if (value != null && mounted) {
                        setState(() {
                          _selectedFileFromMultiplePick.addAll(value);
                        });
                      }
                    },
                    imageFile: (dynamic value) {})
              ]),
        ),
      );
    });
  }
}
