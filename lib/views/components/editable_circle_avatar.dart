import 'dart:io';
import 'package:announcements_app/views/components/components.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:auto_route/auto_route.dart';

class EditableCircleAvatar extends StatefulWidget {
  const EditableCircleAvatar({Key? key, this.defaultImageProvider, required this.onImageSelected}) : super(key: key);

  final ImageProvider<Object>? defaultImageProvider;
  final Function(File? image) onImageSelected;

  @override
  State<EditableCircleAvatar> createState() => _EditableCircleAvatarState();
}

class _EditableCircleAvatarState extends State<EditableCircleAvatar> {

  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.passthrough,
      children: [
        CustomCircleAvatar(backgroundImage: _image != null ? FileImage(File(_image!.path)) : widget.defaultImageProvider),
        Container(
            margin: const EdgeInsetsDirectional.only(start: 60, top: 60),
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey
            ),
            child: IconButton(onPressed: () => showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: const Text('Select image source'),
                actions: [
                  TextButton(onPressed: () => _pickImage(ImageSource.gallery), child: const Text('Gallery')),
                  TextButton(onPressed: () => _pickImage(ImageSource.camera), child: const Text('Camera')),
                ],
              );
            }), icon: const Icon(Icons.edit, color: Colors.white), iconSize: 20)),
      ],
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: source);
    if(image != null){
      setState(() {
        _image = image;
        widget.onImageSelected(File(image.path));
      });
    }
    context.popRoute();
  }
}
