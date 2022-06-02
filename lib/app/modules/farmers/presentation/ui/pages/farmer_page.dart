import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:reatividadeflutter/app/modules/farmers/presentation/controllers/farmer_store.dart';

class FarmerPage extends StatelessWidget {
  final FarmerStore farmerStore;
  const FarmerPage({
    Key? key,
    required this.farmerStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScopedBuilder.transition(
            store: farmerStore,
            transition: (_, child) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                child: child,
              );
            },
            onLoading: (_) => const LinearProgressIndicator(),
            onState: (_, state) => Text('$state'),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.exit_to_app),
        onPressed: () {
          farmerStore.getFarmerWithPhone(phone: '45');
        },
      ),
    );
  }
}
