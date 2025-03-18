import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Launch extends StatelessWidget {
  const Launch({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      // Listen to auth state changes
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final session = snapshot.hasData ? snapshot.data!.session : null;

        // Ensure navigation happens outside of build
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (session != null) {
            GoRouter.of(context).go('/');
          } else {
            GoRouter.of(context).go('/register');
          }
        });

        // Return an empty container to avoid building unnecessary UI
        return const SizedBox.shrink();
      },
    );
  }
}
