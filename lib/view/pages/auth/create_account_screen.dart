import 'package:app_registration/consts/app_color.dart';
import 'package:app_registration/view/widgets/barrel_widgets.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final PageController _pageController = PageController();
  static const int _totalSteps = 4;
  int _currentStep = 0;

  double get _progressValue => 0.25 + (_currentStep / (_totalSteps - 1)) * 0.75;

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      _updateStep(_currentStep + 1);
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      debugPrint("Cuenta creada");
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      _updateStep(_currentStep - 1);
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _updateStep(int step) {
    setState(() => _currentStep = step);
  }

  List<Widget> _buildSteps() {
    return [
      _buildStepContent(
        title: 'Ingresa tu número de cédula',
      ),
      _buildStepContent(
        title: 'Ingresa tu número de\nteléfono móvil',
        subTitle: 'Te enviaremos por SMS un código de cuatro dígitos',
      ),
      _buildStepContent(
        title: 'Ingresa el código',
        subTitle: 'Es un número de cuatro dígitos que te enviaremos al &&&&&&&',
      ),
      _buildStepContent(
        title: 'Crea una contraseña',
      ),
    ];
  }

  Widget _buildStepContent({
    required String title,
    String? subTitle,
    Widget content = const SizedBox(),
  }) {
    return AppRoundedContainer(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LinearProgressIndicator(
              value: _progressValue,
              backgroundColor: AppColors.enabled.withOpacity(0.2),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: AppColors.highEmphasis,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (subTitle != null) ...[
            const SizedBox(height: 30),
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.highEmphasis,
              ),
            ),
          ],
          content,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: const Text(
        'Crear cuenta',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actionsAppBar: [
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {},
        ),
      ],
      overrideBackAction: (_currentStep > 0) ? _previousStep : null,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _buildSteps(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 30),
        child: AppButton(
          title: 'Continuar',
          onTap: _nextStep,
        ),
      ),
    );
  }
}
