import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reatividadeflutter/app/modules/farmers/presentation/controllers/farmer_controller.dart';
import 'package:reatividadeflutter/app/shared/hard_debug.dart';

class FarmerPage extends StatelessWidget {
  FarmerPage({Key? key}) : super(key: key);

  final controller = Modular.get<FarmerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              controller.farmerEntity.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.exit_to_app),
        onPressed: () {
          HardDebug().consoleMessager('Rota /home');
          Modular.to.pop();
        },
      ),
    );
  }
}
