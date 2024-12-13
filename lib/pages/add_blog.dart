import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lunaflow/services/blog_logs.dart';
import 'package:lunaflow/widgets/layout/CustomButton.dart';
import 'package:provider/provider.dart';

import '../services/user_model.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;
  Uint8List? _imageBytes;
  String _base64Image = "";
  bool isLoading = false;
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      isLoading = true;
    });
    if (pickedImage != null) {
      final bytes = await pickedImage.readAsBytes();
      setState(() {
        _image = File(pickedImage.path);
        _base64Image = base64Encode(bytes);
        isLoading=false;
      });
    } else {
      print("No image selected");
      setState(() {
        isLoading = false;
      });
    }
  }

  // Function to handle blog submission
  void _submitBlog() async {
    setState(() {
      isLoading = true;
    });
    final user = Provider.of<UserModel?>(context, listen: false);

    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _image != null) {
      await Blogs().saveBlogs(
          userId: user!.uid,
          image: _base64Image,
          title: _titleController.text,
          desc: _descriptionController.text);

      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Blogs added successfully!!')),

      );
      Navigator.pushNamed(context, '/community');
    } else {
      setState(() {
        isLoading = false;
      });
      // Show a snackbar if any field is missing
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill all the fields and select an image')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
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
                      child: _imageBytes == null
                          ? Container(
                              height: 200,
                              color: Colors.grey[300],
                              child: const Icon(Icons.camera_alt, size: 50),
                            )
                          : Image.memory(
                              _imageBytes!,
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
                  Center(
                      child:
                          Custombutton(btnName: 'Add', onPressed: _submitBlog)),
                ],
              ),
            ),
          );
  }
}
