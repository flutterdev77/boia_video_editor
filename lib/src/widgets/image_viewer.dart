import 'dart:io';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_editor/src/controller.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    required this.controller,
    required this.imagePath,
    this.child,
    this.fadeIn = true,
  });

  final VideoEditorController controller;
  final String imagePath;
  final Widget? child;
  final bool fadeIn;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: controller.video.value.aspectRatio,
            child: fadeIn
                ? FadeInImage(
                    fadeInDuration: const Duration(milliseconds: 400),
                    image: FileImage(File(imagePath)),
                    placeholder: MemoryImage(kTransparentImage),
                  )
                : Image.file(
                    File(imagePath),
                    color: const Color.fromRGBO(255, 255, 255, 0.2),
                    colorBlendMode: BlendMode.modulate,
                  ),
          ),
          if (child != null)
            AspectRatio(
              aspectRatio: controller.video.value.aspectRatio,
              child: child,
            ),
        ],
      ),
    );
  }
}
