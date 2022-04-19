import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/src/features/auth/auth_controller.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();

    return ElevatedButton(
      onPressed: controller.state == AuthState.loading
          ? null
          : () {
              controller.loginAction(context);
            },
      child: const Text('Login'),
    );
  }
}
