import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  final String testName;
  final String treatmentName;

  const CameraPage({
    super.key,
    required this.testName,
    required this.treatmentName,
  });

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _videoFile;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    // Inicia a gravação automaticamente após um pequeno delay
    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        _captureVideo();
      }
    });
  }

  // Função para capturar vídeo
  Future<void> _captureVideo() async {
    setState(() {
      _isRecording = true;
    });
    
    try {
      final XFile? video = await _picker.pickVideo(
        source: ImageSource.camera,
        maxDuration: const Duration(seconds: 60), // Limite de 60 segundos
      );

      setState(() {
        _videoFile = video;
        _isRecording = false;
      });

      if (video != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vídeo salvo com sucesso!'),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isRecording = false;
      });
      print('Erro ao capturar vídeo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.testName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Subtítulo com o nome do tratamento
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Tratamento: ${widget.treatmentName}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          // Preview do vídeo (se disponível)
          Expanded(
            child: Center(
              child: _videoFile != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 48),
                        SizedBox(height: 16),
                        Text('Vídeo gravado com sucesso!'),
                        SizedBox(height: 8),
                        Text(
                          'Salvo em: ${_videoFile!.path}',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : _isRecording
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text('Aguardando câmera...'),
                          ],
                        )
                      : Text('Nenhum vídeo gravado ainda'),
            ),
          ),
          // Botão para iniciar gravação
          Container(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: _isRecording ? null : _captureVideo,
              icon: const Icon(Icons.videocam),
              label: Text(_isRecording ? 'Aguardando câmera...' : 'Iniciar Gravação (60s)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}