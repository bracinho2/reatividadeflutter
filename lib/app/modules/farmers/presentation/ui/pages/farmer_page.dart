import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:reatividadeflutter/app/modules/farmers/presentation/controllers/farmer_controller.dart';

class FarmerPage extends StatelessWidget {
  FarmerPage({Key? key}) : super(key: key);

  final controller = Modular.get<FarmerController>();

  @override
  Widget build(BuildContext context) {
    print('scoped builder');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScopedBuilder.transition(
            store: controller,
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
          ScopedBuilder(
            store: controller,
            onState: (context, state) => Text(state.toString()),
            onError: (context, error) => Text(error.toString()),
            onLoading: (context) => const CircularProgressIndicator(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.exit_to_app),
        onPressed: () {
          controller.getFarmerWithPhone(phone: '45');
          // controller.saveFarmer(
          //     farmerEntity: FarmerEntity(
          //   'roberto',
          //   'lastName',
          //   'birth',
          //   'phone',
          //   'email',
          //   'address',
          //   'latitude',
          //   'longitude',
          // ));
          // HardDebug().consoleMessager('Rota /home');
          // Modular.to.pop();
        },
      ),
    );
  }
}
