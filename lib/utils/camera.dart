import 'package:camera/camera.dart';
import 'package:ebike_flutter/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Camera extends StatefulWidget {
  final bool? isImage;
  final String? imageCondition;

  const Camera({super.key, this.isImage, this.imageCondition});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController? _cameraController;
  late final KYCProvider _provider;

  Future<void> takeImage(BuildContext context) async {
    XFile? imagePath = await _cameraController?.takePicture();

    if (imagePath != null && widget.imageCondition != null) {
      _provider.setImageFile(imagePath.path, widget.imageCondition!);
      if (context.mounted) {
        context.pop();
      }
    }
  }

  initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    if (widget.isImage != null && widget.isImage == true) {
      _cameraController = CameraController(
        cameras[0],
        ResolutionPreset.high,
        enableAudio: false,
      );
    } else {
      _cameraController = CameraController(
        front,
        ResolutionPreset.high,
        enableAudio: true,
      );
    }

    _cameraController?.initialize().then((value) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<KYCProvider>(context, listen: false);
    initCamera();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _cameraController != null
        ? Stack(
            children: [
              SizedBox(
                height: double.infinity,
                child: CameraPreview(_cameraController!),
              ),
              // Positioned.fill(
              //   child: Image.asset(
              //     'assets/images/ic_camera.png',
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Positioned(
                top: 50,
                left: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              // const Align(
              //   alignment: Alignment(0, -0.4),
              //   child: SizedBox(
              //     width: 300,
              //     child: Text(
              //       'Please position your card in this frame, Tap the screen to focus.',
              //       style: TextStyle(
              //         color: Colors.white,
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
              Positioned(
                bottom: 30,
                left: MediaQuery.of(context).size.width / 2.3,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        await takeImage(context);
                      },
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Container();
  }
}
