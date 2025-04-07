import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/features/tick_session/larval_immersion_test/4_add_treament_page.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/common/widgets/bottomNavigationBar.dart';

class TreatmentsPage extends StatelessWidget {
  final String testName; // Nome do teste

  const TreatmentsPage({super.key, required this.testName});

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
      body: const Center(
        child: Text("Não há tratatamentos cadastrados"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTreatmentPage(
                testName: testName,
              ),
            ),
          );
        },
        backgroundColor: AppColors.greenLighTwo,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0, // Define qual aba está ativa
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/HomePage');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/add_treatment'); // Substitua pela rota da câmera
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/ProfilePage'); // Substitua pela rota do perfil
          }
        },
      ),
    );
  }
}