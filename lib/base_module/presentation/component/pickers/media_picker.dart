import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaPicker {
  static Future<String?> getImage({
    required BuildContext context,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      builder: (_) {
        return ImagePickerDialog();
      },
    );
  }
}

class ImagePickerDialog extends StatefulWidget {
  @override
  _ImagePickerDialogState createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  bool _isPickingImage = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !_isPickingImage,
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera_enhance),
            title: const Text("Camera"),
            onTap: () => _takeImage(),
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text("Gallery"),
            onTap: () => _pickImage(),
          ),
        ],
      ),
    );
  }

  Future<void> _takeImage() async {
    if (_isPickingImage) return;
    _isPickingImage = true;
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    _isPickingImage = false;
    Navigator.pop(context, pickedFile?.path);
  }

  Future<void> _pickImage() async {
    _isPickingImage = true;
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    _isPickingImage = false;
    Navigator.pop(context, pickedFile?.path);
  }
}
