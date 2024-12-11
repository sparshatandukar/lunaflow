import 'package:flutter/material.dart';

class FileIUpload extends StatefulWidget {
  final String label,upload;
  final double? height;
  final VoidCallback onPressed;

  const FileIUpload({
    super.key,
    required this.label,
    required this.onPressed,
     required this.upload, required this.height,
  });

  @override
  State<FileIUpload> createState() => _FileIUploadState();
}

class _FileIUploadState extends State<FileIUpload> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontFamily: 'poppins',
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 5),
        OutlinedButton.icon(
          onPressed: widget.onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.white,
            fixedSize: Size(double.infinity, widget.height as double),
            side: const BorderSide(
              color: Colors.black,
              width: 1.5,
              style: BorderStyle.solid,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          icon: const Icon(
            Icons.add_a_photo_outlined,
            color: Colors.black,
          ),
          label: Text(
            widget.upload,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
