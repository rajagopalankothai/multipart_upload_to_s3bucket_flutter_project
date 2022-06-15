import 'package:flutter/material.dart';

class UploadAllButton extends StatelessWidget {
  const UploadAllButton(
      {Key? key, required this.onTap, required this.imageType})
      : super(key: key);
  final String imageType;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text('Multiple attachment upload for $imageType')),
        OutlinedButton(
            onPressed: () => onTap(), child: const Text('Upload All')),
      ],
    );
  }
}
