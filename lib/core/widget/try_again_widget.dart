import 'package:flutter/material.dart';

class TryAgainWidget extends StatelessWidget {
  final VoidCallback onTap;
  const TryAgainWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onTap,
        child: const Text('Try Again'),
      ),
    );
  }
}
