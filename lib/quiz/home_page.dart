import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Responde Ai!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            _AppButton(text: 'Iniciar Quiz', onPressed: () {}),
            _AppButton(text: 'Criar Quiz', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class _AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const _AppButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
