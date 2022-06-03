import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';

import 'package:reatividadeflutter/app/modules/farmers/presentation/controllers/farmer_store.dart';
import 'package:reatividadeflutter/app/modules/farmers/presentation/ui/widgets/app_bar_widget.dart';
import 'package:reatividadeflutter/app/modules/farmers/presentation/ui/widgets/button_widget.dart';
import 'package:reatividadeflutter/app/modules/farmers/presentation/ui/widgets/input_text_widget.dart';

class FarmerPageAdd extends StatelessWidget {
  final FarmerStore farmerStore;
  FarmerPageAdd({
    Key? key,
    required this.farmerStore,
  }) : super(key: key);

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthDateController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final arg = Modular.args.data;

    final String? id;

    if (arg != null) {
      final farmerEntity = arg as FarmerEntity;
      nameController.text = farmerEntity.name;
      latitudeController.text = 'latitude';
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const AppBarWidget(
          title: 'Que vamos fazer?', subTitle: 'Vamos adicionar um Farmer?'),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              InputTextWidget(
                label: 'Name',
                obscureText: false,
                maxLines: 1,
                controller: nameController,
              ),
              InputTextWidget(
                label: 'Lastname',
                obscureText: false,
                maxLines: 1,
                controller: lastNameController,
              ),
              InputTextWidget(
                label: 'Birth Date',
                obscureText: false,
                maxLines: 1,
                controller: birthDateController,
              ),
              InputTextWidget(
                label: 'Phone',
                obscureText: false,
                maxLines: 1,
                controller: phoneController,
              ),
              InputTextWidget(
                label: 'Email',
                obscureText: false,
                maxLines: 1,
                controller: emailController,
              ),
              InputTextWidget(
                label: 'Address',
                obscureText: false,
                maxLines: 1,
                controller: addressController,
              ),
              InputTextWidget(
                label: 'Latitude',
                obscureText: false,
                maxLines: 1,
                controller: latitudeController,
              ),
              InputTextWidget(
                label: 'Longitude',
                obscureText: false,
                maxLines: 1,
                controller: longitudeController,
              ),
              ButtonWidget(
                label: 'Add Farmer',
                color: Colors.black12,
                onPressed: () {
                  farmerStore.saveFarmer(
                    name: nameController.text,
                    lastName: lastNameController.text,
                    birthDate: birthDateController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                    address: addressController.text,
                    latitude: latitudeController.text,
                    longitude: longitudeController.text,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
