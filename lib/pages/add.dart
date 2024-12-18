import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserAdd extends StatelessWidget {
  const UserAdd({super.key});

  // Function to show the AlertDialog
  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Image Selected: ${image.path}")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No image selected.")),
      );
    }
  }

    void _showAddDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text("Choose an option"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(dialogContext); // Close the dialog
                  _pickImage(context, ImageSource.camera); // Directly open camera
                },
                child: const Text("Add by Camera"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(dialogContext); // Close the dialog
                  _pickImage(context, ImageSource.gallery); // Directly open gallery
                },
                child: const Text("Add by Gallery"),
              ),
            ],
          );
        },
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Add"),
        actions: [
          IconButton(onPressed: (){
            _showAddDialog(context);
          }, icon: const Icon(Icons.add)),
        ],
      ),
        );
  }
}
