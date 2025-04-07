import 'package:financy_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/common/widgets/bottomNavigationBar.dart';
import '2_add_test_page.dart';
import '3_treatments_page.dart';

class LarvalImmersionTestPage extends StatefulWidget {
  const LarvalImmersionTestPage({super.key});

  @override
  State<LarvalImmersionTestPage> createState() => _LarvalImmersionTestPageState();
}

class _LarvalImmersionTestPageState extends State<LarvalImmersionTestPage> {
  final List<Map<String, String>> _tests = []; // Lista para armazenar os testes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Teste de Imersão de Larvas",
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
      body: _tests.isEmpty
          ? const Center(
              child: Text(
                "Não há testes disponíveis.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              itemCount: _tests.length,
              itemBuilder: (context, index) {
                final test = _tests[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(
                      test['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(test['description']!),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TreatmentsPage(testName: test['name']!),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navegar para a página de adicionar teste e aguardar o retorno dos dados
          final newTest = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTestPage(),
            ),
          );

          // Adicionar o novo teste à lista, se houver retorno
          if (newTest != null) {
            setState(() {
              _tests.add(newTest);
            });
          }
        },
        backgroundColor:AppColors.greenLighTwo,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0, // Define qual aba está ativa
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/HomePage');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/CameraPage'); // Substitua pela rota da câmera
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/ProfilePage'); // Substitua pela rota do perfil
          }
        },
      ),
    );
  }
}