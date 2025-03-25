import 'package:financy_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class VideoProtocolPage extends StatelessWidget {
  final String testName; // Nome do teste
  final String treatmentName; // Nome do tratamento

  const VideoProtocolPage({
    super.key,
    required this.testName,
    required this.treatmentName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          testName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título "Novo Tratamento"
            const Text(
              "Novo Tratamento",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Texto informativo
            const Text(
              "Para iniciar o protocolo de captura de imagens das larvas, certifique-se das seguintes especificações:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "→ Utilize smartphone com uma câmera sobre uma estrutura com uma lâmpada LED e um fundo branco com uma altura de 22 cm entre o dispositivo e o fundo.\n\n"
              "→ Os pacotes serão colocados em uma pequena base metálica na parte inferior com um fundo verde e mantidos juntos por ímãs.\n\n"
              "→ O movimento das larvas será verificado ao longo do tempo a partir da comparação do posicionamento das larvas entre as fotografias obtidas.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            // Botão "Iniciar captura de vídeos"
            ElevatedButton(
              onPressed: () {
                // Navegar para a próxima etapa (protocolo de captura de vídeos)
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenLighTwo, // Cor do botão
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
                "Iniciar captura de vídeos",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}