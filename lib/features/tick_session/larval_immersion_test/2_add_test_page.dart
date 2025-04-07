import 'package:financy_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AddTestPage extends StatelessWidget {
  const AddTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Adicionar Teste",
          style: TextStyle(
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
            const Text(
              "Nome do Teste",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite o nome do teste",
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Descrição",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite a descrição do teste",
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final String name = nameController.text;
                final String description = descriptionController.text;

                if (name.isEmpty || description.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Por favor, preencha todos os campos."),
                    ),
                  );
                  return;
                }

                // Retornar os dados do teste para a página anterior
                Navigator.pop(context, {
                  'name': name,
                  'description': description,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenLighTwo,
              ),
              child: const 
                Text("Salvar",
                  style: TextStyle(color: Colors.white),
                ),
            ),
          ],
        ),
      ),
    );
  }
}