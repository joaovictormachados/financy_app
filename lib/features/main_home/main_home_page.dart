import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/features/tick_session/home/tick_home_page.dart';
import 'package:financy_app/features/tick_session/larval_immersion_test/1_larval_immersion_test_page.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Início",
          style: TextStyle(
            color: Colors.black, // Texto preto
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white, // Fundo branco
        elevation: 0, // Remove a sombra padrão do AppBar
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), // Altura da borda
          child: Container(
            color: Colors.grey[300], // Cor da borda cinza
            height: 1.0, // Espessura da borda
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            // Botão 1: Teste de Imersão de Larvas
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TickHomePage(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.lightGreen[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/carrapato_realista.png', // Caminho do ícone
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        "Carrapato Bovino",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // // Botão 2: Teste de Pacote Larval
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pushNamed(context, '/larval_package_test');
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.all(16.0),
            //     decoration: BoxDecoration(
            //       color: Colors.lightGreen[100],
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //     child: Row(
            //       children: [
            //         Image.asset(
            //           'assets/images/pacote_larval.png', // Caminho do ícone
            //           width: 40,
            //           height: 40,
            //         ),
            //         const SizedBox(width: 16),
            //         const Expanded(
            //           child: Text(
            //             "Teste de Pacote Larval",
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //         const Icon(Icons.arrow_forward_ios),
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 20),
            //  GestureDetector(
            //   onTap: () {
            //     Navigator.pushNamed(context, '/larval_package_test');
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.all(16.0),
            //     decoration: BoxDecoration(
            //       color: Colors.lightGreen[100],
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //     child: Row(
            //       children: [
            //         Image.asset(
            //           'assets/images/imersao_adulto_egg.png', // Caminho do ícone
            //           width: 40,
            //           height: 40,
            //         ),
            //         const SizedBox(width: 16),
            //         const Expanded(
            //           child: Text(
            //             "Teste de Imersão de Adultos",
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //         const Icon(Icons.arrow_forward_ios),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Câmera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação do botão flutuante
        },
        backgroundColor: AppColors.greenLighTwo,
        child: const Icon(Icons.add,
          color: Colors.white,)// Ícone branco),
      ),
    );
  }
}