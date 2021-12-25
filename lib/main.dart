import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nagasone/presentation/chips_screen.dart';
import 'package:nagasone/presentation/fc_screen.dart';
import 'package:nagasone/presentation/theme.dart';
import 'package:nagasone/stores/chip_store.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<ChipStore>(
    ChipStore(),
    signalsReady: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              PopupMenuButton<int>(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                onSelected: (value) {},
                icon: const Icon(Icons.more_vert, color: AppColors.black),
                itemBuilder: (_) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Text("Пересобрать бд"),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text("Создать дамп"),
                  ),
                  const PopupMenuItem(
                    value: 3,
                    child: Text("Поменять юрлу"),
                  ),
                  const PopupMenuItem(
                    value: 4,
                    child: Text("Стата по фишкам"),
                  ),
                  const PopupMenuItem(
                    value: 5,
                    child: Text("Стата по FC"),
                  ),
                ],
              ),
            ],
            backgroundColor: AppColors.white,
            elevation: 0,
            centerTitle: true,
            bottom: const TabBar(
              indicatorColor: AppColors.black,
              tabs: [
                Tab(
                  child: Text('FACECONTROL', style: TextStyles.titleText14),
                ),
                Tab(
                  child: Text('ФИШКИ', style: TextStyles.titleText14),
                ),
              ],
            ),
            title: const Text(
              'NAGASONE',
              style: TextStyles.titleText16,
            ),
          ),
          body: TabBarView(
            children: [
              FCScreen(),
              ChipsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
