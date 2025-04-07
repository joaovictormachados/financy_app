import 'package:financy_app/common/constants/themes/default_theme.dart';
import 'package:financy_app/features/splash/splash_page.dart';
import 'package:financy_app/features/onboarding/onboarding_page.dart';
import 'package:financy_app/features/sign_up/sign_up_page.dart';
import 'package:financy_app/features/main_home/main_home_page.dart';
import 'package:financy_app/features/tick_session/home/tick_home_page.dart';
import 'package:financy_app/features/tick_session/larval_immersion_test/2_add_test_page.dart';
import 'package:financy_app/features/tick_session/larval_immersion_test/4_add_treament_page.dart';
import 'package:financy_app/features/tick_session/larval_immersion_test/1_larval_immersion_test_page.dart';
import 'package:financy_app/features/tick_session/larval_immersion_test/3_treatments_page.dart';
import 'package:financy_app/features/tick_session/larval_immersion_test/5_video_protocol_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App ({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: defaultTheme,
      home: OnboardingPage(),
      routes: {
        '/OnBoarding': (context) => OnboardingPage(),
        '/SignUp': (context) => SignUpPage(),
        '/HomePage': (context) => MainHomePage(),
        '/TickHomePage': (context) => TickHomePage(),
        '/larval_immersion_test': (context) => const LarvalImmersionTestPage(),
        '/add_test': (context) => const AddTestPage(),
        '/treatments': (context) => const TreatmentsPage(testName: ''), // Exemplo de rota
        '/add_treatment': (context) => const AddTreatmentPage(testName: ''),
        '/video_protocol': (context) => const VideoProtocolPage(
          testName: '',
          treatmentName: '',
        ),

      },
    );
  }
}