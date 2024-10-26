import 'package:app_registration/consts/app_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndConditionsText extends StatelessWidget {
  final String termsUrl = 'https://www.argentina.gob.ar/terminos-y-condiciones';

  const TermsAndConditionsText({super.key});

  void _launchURL() async {
    if (await canLaunchUrl(Uri.parse(termsUrl))) {
      await launchUrl(Uri.parse(termsUrl));
    } else {
      throw 'No se puede abrir el enlace $termsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Al continuar, aceptas los ',
        style: const TextStyle(color: AppColors.mediumEmphasis, fontSize: 16),
        children: [
          TextSpan(
            text: 'Términos y Condiciones',
            style: const TextStyle(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = _launchURL,
          ),
        ],
      ),
    );
  }
}
