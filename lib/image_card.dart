import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_presigned_url/connector/auth_connector.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(
      {Key? key,
      required this.imageFile,
      required this.onTap,
      required this.onUpload})
      : super(key: key);
  final File imageFile;
  final Function() onTap;
  final Function() onUpload;

  @override
  Widget build(BuildContext context) {
    return AuthConnector(
        builder: (BuildContext context, AuthViewModel authViewModel) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Stack(children: [
              const SizedBox(height: 125, width: 160),
              Positioned(
                  bottom: 0.1,
                  left: 0.1,
                  child: Container(
                      color: Colors.blue,
                      height: 110,
                      width: 150,
                      child: Image.file(imageFile, fit: BoxFit.fill))),
              Positioned(
                  top: 0.1,
                  right: 0.0,
                  child: InkWell(
                      onTap: () => onTap(),
                      child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blueGrey),
                          child: const Icon(Icons.close, color: Colors.white))))
            ]),
          ),
          const Spacer(),
          OutlinedButton(
              onPressed: () => onUpload(),
              child: authViewModel.isLoading
                  ? const SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.blueGrey))
                  : const Text('Upload'))
        ],
      );
    });
  }
}
