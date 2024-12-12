import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lunaflow/widgets/layout/CustomButton.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  // Function to handle blog submission
  void _submitBlog() {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _image != null) {
      // Here you can handle the blog submission (e.g., saving the blog to a database or server)
      // For now, just print the details
      print('Title: ${_titleController.text}');
      print('Description: ${_descriptionController.text}');
      print('Image Path: ${_image!.path}');
    } else {
      // Show a snackbar if any field is missing
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill all the fields and select an image')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Blog'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Navigate back on back button press
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image selection ction
            SizedBox(
              width: 400,
              child: GestureDetector(
                onTap: _pickImage,
                child: _image == null
                    ? Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: const Icon(Icons.camera_alt, size: 50),
                      )
                    : Image.file(
                        _image!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(height: 16),
            // Title TextField
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Blog Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Description TextField
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Blog Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Submit Button
            Center(child: Custombutton(btnName: 'Add', onPressed: () {})),
          ],
        ),
      ),
    );
  }
}
