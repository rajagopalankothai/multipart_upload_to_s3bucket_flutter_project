import 'package:flutter/material.dart';
import 'package:flutter_presigned_url/check_for_permission_status_for_file_picker.dart';
import 'package:flutter_presigned_url/check_for_permission_status_for_image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
                      // driveViewModel.uploadFileAction(
                      //     value?.path.split('/').last, File(value!.path),
                      //         (String? url) {
                      //       setState(() {
                      //         pickedImage = value;
                      //         s3BucketKey = url;
                      //       });
                      //     });
                    }
                  }),
              CheckPermissionForImagePicker(
                  name: 'Camera',
                  icon: Icons.photo_camera,
                  imageFile: (dynamic value) {
                    if (value != null && mounted) {
                      // driveViewModel.uploadFileAction(
                      //     value?.path.split('/').last, value, (String? url) {
                      //   setState(() {
                      //     pickedImage = value;
                      //     s3BucketKey = url;
                      //   });
                      // });
                    }
                  }),
              CheckPermissionForFilePicker(
                  name: 'Image Library with File Picker (Single)',
                  icon: Icons.photo_library,
                  multipleUpload: false,
                  imageFileList: (dynamic value) {},
                  imageFile: (dynamic value) {
                    if (value != null && mounted) {
                      // driveViewModel.uploadFileAction(
                      //     value?.path.split('/').last, File(value!.path),
                      //         (String? url) {
                      //       setState(() {
                      //         pickedImage = value;
                      //         s3BucketKey = url;
                      //       });
                      //     });
                    }
                  }),
              CheckPermissionForFilePicker(
                  name: 'Image Library with File Picker (Multiple)',
                  icon: Icons.photo_library,
                  multipleUpload: true,
                  imageFileList: (dynamic value) {
                    if (value != null && mounted) {
                      // driveViewModel.uploadFileAction(
                      //     value?.path.split('/').last, File(value!.path),
                      //         (String? url) {
                      //       setState(() {
                      //         pickedImage = value;
                      //         s3BucketKey = url;
                      //       });
                      //     });
                    }
                  },
                  imageFile: (dynamic value) {})
            ]),
      ),
    );
  }
}
