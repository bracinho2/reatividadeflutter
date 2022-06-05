import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/presentation/controllers/farmer_store.dart';
import 'package:reatividadeflutter/app/modules/farmers/presentation/ui/widgets/app_bar_widget.dart';
import 'package:reatividadeflutter/app/shared/hard_debug.dart';

class FarmerPage extends StatefulWidget {
  final FarmerStore farmerStore;
  FarmerPage({
    Key? key,
    required this.farmerStore,
  }) : super(key: key);

  @override
  State<FarmerPage> createState() => _FarmerPageState();
}

class _FarmerPageState extends State<FarmerPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int indexBottomNavigatorBar = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(
          title: 'Farmer Page',
          subTitle: 'Hola Que tal',
        ),
        body: PageView(
          controller: _pageController,
          children: [
            Container(
              color: Colors.amber,
              child: const Center(
                child: Text('Esquerda'),
              ),
            ),
            Container(
              color: Colors.blueAccent,
              child: const Center(
                child: Text('Centro'),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ScopedBuilder.transition(
                    store: widget.farmerStore,
                    transition: (_, child) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 700),
                        child: child,
                      );
                    },
                    onLoading: (_) => const LinearProgressIndicator(),
                    onState: (context, List<FarmerEntity> state) {
                      if (widget.farmerStore.state.isEmpty) {
                        return const Center(
                          child: Text("No Farmer Found!"),
                        );
                      }
                      return ListView.builder(
                        itemCount: state.length,
                        itemBuilder: ((context, index) => ListTile(
                              title: Text(state[index].name),
                              subtitle: Text(state[index].lastName),
                            )),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(Icons.exit_to_app),
          onPressed: () {
            HardDebug().consoleMessager('Rota /farmerAdd');
            widget.farmerStore.filterList(filter: '');
            // Modular.to.pushNamed(
            //   '/farmer/farmerAdd',
            //   arguments: FarmerEntity(
            //       name: 'Deu',
            //       lastName: '',
            //       birthDate: '',
            //       phone: '',
            //       email: '',
            //       address: '',
            //       latitude: '',
            //       longitude: ''),
            // );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottomNavigatorBar,
          onTap: (int page) {
            setState(() {
              indexBottomNavigatorBar = page;
              _pageController.animateToPage(
                page,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_left), label: 'Left'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Center'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Farmers'),
          ],
        ),
      ),
    );
  }
}
