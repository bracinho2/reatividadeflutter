import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';

import 'package:reatividadeflutter/app/modules/farmers/presentation/controllers/farmer_store.dart';
import 'package:reatividadeflutter/app/modules/farmers/presentation/ui/widgets/app_bar_widget.dart';
import 'package:reatividadeflutter/app/shared/hard_debug.dart';

class FarmerPage extends StatelessWidget {
  final FarmerStore farmerStore;
  const FarmerPage({
    Key? key,
    required this.farmerStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(
          title: 'Farmer Page',
          subTitle: 'Hola Que tal',
        ),
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
            HardDebug().consoleMessager('Rota /farmerAdd');
            Modular.to.pushNamed(
              '/farmer/farmerAdd',
              arguments: FarmerEntity(
                  name: 'Deu',
                  lastName: '',
                  birthDate: '',
                  phone: '',
                  email: '',
                  address: '',
                  latitude: '',
                  longitude: ''),
            );
          },
        ),
      ),
    );
  }
}
