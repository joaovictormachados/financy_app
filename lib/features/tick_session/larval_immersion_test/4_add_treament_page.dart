import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/features/tick_session/larval_immersion_test/5_video_protocol_page.dart';
import 'package:flutter/material.dart';

class AddTreatmentPage extends StatelessWidget {
  final String testName; // Nome do teste
  final String treatmentName; // Nome do tratamento (pode ser vazio inicialmente)

  const AddTreatmentPage({
    super.key,
    required this.testName,
    this.treatmentName = '',
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController treatmentNameController = TextEditingController(text: treatmentName);
    final TextEditingController concentrationController = TextEditingController();

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
            // Nome do tratamento
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
            // Campo para o nome do tratamento
            const Text(
              "Nome do Tratamento",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: treatmentNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite o nome do tratamento",
              ),
            ),
            const SizedBox(height: 16),
            // Campo para a concentração
            const Text(
              "Concentração do Produto",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: concentrationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite a concentração do produto",
              ),
            ),
            const SizedBox(height: 24),
            // Botão de continuar
           ElevatedButton(
              onPressed: () {
                final String treatmentName = treatmentNameController.text;
                final String concentration = concentrationController.text;

                if (treatmentName.isEmpty || concentration.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Por favor, preencha todos os campos."),
                    ),
                  );
                  return;
                }

                print("Navegando para VideoProtocolPage com testName: $testName e treatmentName: $treatmentName");

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoProtocolPage(
                      testName: testName,
                      treatmentName: treatmentName,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenLighTwo,
              ),
              child: const Text(
                "Continuar",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}