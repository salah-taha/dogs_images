import 'package:flutter/material.dart';

class SliverSpacer extends StatelessWidget {
  const SliverSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 16,
      ),
    );
  }
}
