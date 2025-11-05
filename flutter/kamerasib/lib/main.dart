import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const CameraApp());
}

class CameraApp extends StatelessWidget {
  const CameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CameraExample(),
    );
  }
}

class CameraExample extends StatefulWidget {
  const CameraExample({super.key});

  @override
  State<CameraExample> createState() => _CameraExampleState();
}

class _CameraExampleState extends State<CameraExample> {
  CameraController? controller;
  int selectedCameraIndex = 0;
  String? filePath;
  bool isRecording = false;
  VideoPlayerController? videoController;

  @override
  void initState() {
    super.initState();
    if (cameras.isNotEmpty) {
      _initCamera(selectedCameraIndex);
    }
  }

  Future<void> _initCamera(int index) async {
    controller = CameraController(
      cameras[index],
      ResolutionPreset.medium,
      enableAudio: true,
    );

    try {
      await controller!.initialize();
      setState(() {});
    } catch (e) {
      debugPrint("Error initializing camera: $e");
    }
  }

  Future<void> _takePicture() async {
    if (controller == null || !controller!.value.isInitialized) return;

    final Directory appDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${appDir.path}/Pictures';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${DateTime.now().millisecondsSinceEpoch}.jpg';

    try {
      final XFile picture = await controller!.takePicture();
      await File(picture.path).copy(filePath);

      setState(() {
        this.filePath = filePath;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Foto disimpan di: $filePath')),
      );
    } catch (e) {
      debugPrint("Error taking picture: $e");
    }
  }

  Future<void> _startVideoRecording() async {
    if (controller == null || controller!.value.isRecordingVideo) return;

    final Directory appDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${appDir.path}/Videos';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${DateTime.now().millisecondsSinceEpoch}.mp4';

    try {
      await controller!.startVideoRecording();
      setState(() {
        isRecording = true;
        this.filePath = filePath;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mulai merekam video...')),
      );
    } catch (e) {
      debugPrint("Error starting video: $e");
    }
  }

  Future<void> _stopVideoRecording() async {
    if (controller == null || !controller!.value.isRecordingVideo) return;

    try {
      final XFile videoFile = await controller!.stopVideoRecording();
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String dirPath = '${appDir.path}/Videos';
      await Directory(dirPath).create(recursive: true);
      final String filePath = '$dirPath/${DateTime.now().millisecondsSinceEpoch}.mp4';
      await File(videoFile.path).copy(filePath);

      setState(() {
        isRecording = false;
        this.filePath = filePath;
      });

      _playVideo(filePath);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Video disimpan di: $filePath')),
      );
    } catch (e) {
      debugPrint("Error stopping video: $e");
    }
  }

  Future<void> _playVideo(String path) async {
    videoController?.dispose();
    videoController = VideoPlayerController.file(File(path));
    await videoController!.initialize();
    await videoController!.play();
    setState(() {});
  }

  void _switchCamera() {
    if (cameras.length < 2) return;

    selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
    _initCamera(selectedCameraIndex);
  }

  @override
  void dispose() {
    controller?.dispose();
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera Example"),
        actions: [
          IconButton(
            icon: const Icon(Icons.switch_camera),
            onPressed: _switchCamera,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: CameraPreview(controller!),
          ),
          if (filePath != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "File: $filePath",
                style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
              ),
            ),
          if (videoController != null && videoController!.value.isInitialized)
            AspectRatio(
              aspectRatio: videoController!.value.aspectRatio,
              child: VideoPlayer(videoController!),
            ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: "photo",
                  onPressed: _takePicture,
                  child: const Icon(Icons.camera_alt),
                ),
                FloatingActionButton(
                  heroTag: "video",
                  backgroundColor: isRecording ? Colors.red : Colors.blue,
                  onPressed:
                      isRecording ? _stopVideoRecording : _startVideoRecording,
                  child: Icon(
                    isRecording ? Icons.stop : Icons.videocam,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
