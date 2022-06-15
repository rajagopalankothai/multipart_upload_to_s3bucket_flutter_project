import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_presigned_url/check_for_permission_status_for_file_picker.dart';
import 'package:flutter_presigned_url/check_for_permission_status_for_image_picker.dart';
import 'package:flutter_presigned_url/connector/auth_connector.dart';
import 'package:flutter_presigned_url/image_card.dart';
import 'package:flutter_presigned_url/upload_all_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<File> _selectedFileFromCamera = [];
  final List<File> _selectedFileFromGallery = [];
  final List<File> _selectedFileFromSinglePick = [];
  final List<File> _selectedFileFromMultiplePick = [];
  final List<String> _attachmentNameList = [];
  final List<File> _fileList = [];
  final _spacer = const SizedBox(height: 8);
  final _emptyBox = const SizedBox();

  void _singleAttachmentUpload(File imageFile, AuthViewModel authViewModel) {
    authViewModel.uploadAttachmentToBucket(
        imageFile.path.split('/').last, imageFile, (String? url) {});
  }

  void _multipleAttachmentUpload(
      List<File> imageFiles, AuthViewModel authViewModel) {
    for (var element in imageFiles) {
      _attachmentNameList.add(element.path.split('/').last);
      _fileList.add(element);
      // driveViewModel.uploadFileAction(element.name, File(element.path!),
      //         (String? url) {
      //       authViewModel.uploadAttachmentToServerAction(
      //           [url!], [element.name], (BuiltList<MyFile>? attachment) {
      //         if (attachment != null) {
      //           for (var p0 in attachment) {
      //             setState(() {
      //               identificationIDList!.add(p0.id!.toString());
      //             });
      //           }
      //         }
      //       }, false);
      //     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthConnector(
        builder: (BuildContext context, AuthViewModel authViewModel) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CheckPermissionForImagePicker(
                    name: 'Photo Gallery with Image Picker',
                    icon: Icons.photo_library,
                    imageFile: (dynamic value) {
                      if (value != null && mounted) {
                        setState(() {
                          _selectedFileFromGallery.add(value);
                        });
                      }
                    }),
                _spacer,
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _selectedFileFromGallery.map((e) {
                      return ImageCard(
                          imageFile: e,
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                _selectedFileFromGallery.remove(e);
                              });
                            }
                          },
                          onUpload: () =>
                              _singleAttachmentUpload(e, authViewModel));
                    }).toList()),
                _spacer,
                _selectedFileFromGallery.length >= 2
                    ? UploadAllButton(
                        imageType: 'Photo Gallery with Image Picker',
                        onTap: () => _multipleAttachmentUpload(
                            _selectedFileFromGallery, authViewModel))
                    : _emptyBox,
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
                _spacer,
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _selectedFileFromCamera.map((e) {
                      return ImageCard(
                          imageFile: e,
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                _selectedFileFromCamera.remove(e);
                              });
                            }
                          },
                          onUpload: () =>
                              _singleAttachmentUpload(e, authViewModel));
                    }).toList()),
                _spacer,
                _selectedFileFromCamera.length >= 2
                    ? UploadAllButton(
                        imageType: 'Camera',
                        onTap: () => _multipleAttachmentUpload(
                            _selectedFileFromCamera, authViewModel))
                    : _emptyBox,
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
                _spacer,
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _selectedFileFromSinglePick.map((e) {
                      return ImageCard(
                          imageFile: e,
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                _selectedFileFromSinglePick.remove(e);
                              });
                            }
                          },
                          onUpload: () =>
                              _singleAttachmentUpload(e, authViewModel));
                    }).toList()),
                _spacer,
                _selectedFileFromSinglePick.length >= 2
                    ? UploadAllButton(
                        imageType: 'Image Library with File Picker (Single)',
                        onTap: () => _multipleAttachmentUpload(
                            _selectedFileFromSinglePick, authViewModel))
                    : _emptyBox,
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
                    imageFile: (dynamic value) {}),
                _spacer,
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _selectedFileFromMultiplePick.map((e) {
                      return ImageCard(
                          imageFile: e,
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                _selectedFileFromMultiplePick.remove(e);
                              });
                            }
                          },
                          onUpload: () =>
                              _singleAttachmentUpload(e, authViewModel));
                    }).toList()),
                _spacer,
                _selectedFileFromMultiplePick.length >= 2
                    ? UploadAllButton(
                        imageType: 'Image Library with File Picker (Multiple)',
                        onTap: () => _multipleAttachmentUpload(
                            _selectedFileFromMultiplePick, authViewModel))
                    : _emptyBox,
              ]),
        ),
      );
    });
  }
}
