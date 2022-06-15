import 'package:flutter/material.dart';
import 'package:flutter_presigned_url/connector/auth_connector.dart';

class UploadAllButton extends StatelessWidget {
  const UploadAllButton(
      {Key? key, required this.onTap, required this.imageType})
      : super(key: key);
  final String imageType;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AuthConnector(
        builder: (BuildContext context, AuthViewModel authViewModel) {
      return Row(
        children: [
          Expanded(child: Text('Multiple attachment upload for $imageType')),
          authViewModel.isLoading
              ? const SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.blueGrey))
              : OutlinedButton(
                  onPressed: () => onTap(), child: const Text('Upload All')),
        ],
      );
    });
  }
}
