import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LoginController extends GetxController {
  var selectedImage = ''.obs;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImage.value = image.path;
    }
  }

  Future<void> pickImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      selectedImage.value = image.path;
    }
  }

  ImageProvider<Object> get avatarImage {
    if (selectedImage.value.isNotEmpty &&
        File(selectedImage.value).existsSync()) {
      return FileImage(File(selectedImage.value));
    }
    return AssetImage('assets/mhnf.jpg');
  }
}
