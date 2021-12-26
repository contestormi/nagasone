import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:nagasone/presentation/chips_screen.dart';
import 'package:nagasone/presentation/fc_screen.dart';
import 'package:nagasone/presentation/theme.dart';
import 'package:nagasone/stores/chip_store.dart';
import 'package:nagasone/stores/fc_store.dart';
import 'package:nagasone/stores/main_store.dart';
import 'package:nagasone/widgets/custom_alert_dialog.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<ChipStore>(
    ChipStore(),
    signalsReady: true,
  );
  getIt.registerSingleton<MainStore>(
    MainStore(),
    signalsReady: true,
  );
  getIt.registerSingleton<FCStore>(
    FCStore(),
    signalsReady: true,
  );
  runApp(
    MaterialApp(home: const MyApp(), debugShowCheckedModeBanner: false),
  );
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
                onSelected: (value) => onSelectedValue(value, context),
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

  void onSelectedValue(int value, BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    switch (value) {
      case 1:
        //getIt<MainStore>().rebuildDB();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              content: Column(
                children: [
                  TextFormField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Введите пароль',
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              firstButtonText: 'Отмена',
              secondButtonText: 'Подтвердить',
              title: 'Введите пароль для ребилда БД',
              secondButtonCallback: () {
                if (_textEditingController.text == 'ggaassoonn') {
                  getIt<MainStore>().rebuildDB();
                  Navigator.pop(context);
                } else {
                  Fluttertoast.showToast(
                      msg: "Неправильный пароль",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: AppColors.grey,
                      textColor: AppColors.white,
                      fontSize: 12.0);
                }
              },
              firstButtonCallback: () => Navigator.pop(context),
            );
          },
        );
        break;
      default:
    }
  }
}
