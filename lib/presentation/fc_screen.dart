import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nagasone/presentation/theme.dart';
import 'package:nagasone/stores/fc_store.dart';
import 'package:nagasone/widgets/custom_alert_dialog.dart';

class FCScreen extends StatelessWidget {
  const FCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FCStore _fcStore = FCStore();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkBlue,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog(
                content: Observer(builder: (_) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'НАЛ',
                            style: TextStyles.textBold14,
                          ),
                          Switch(
                            value: _fcStore.isSwitched,
                            onChanged: (value) => _fcStore.switcher(value),
                            activeTrackColor: AppColors.lightBlue,
                            activeColor: AppColors.darkBlue,
                            inactiveThumbColor: AppColors.darkBlue,
                            inactiveTrackColor: AppColors.lightBlue,
                          ),
                          const Text('БЕЗНАЛ', style: TextStyles.textBold14),
                        ],
                      ),
                      const Text(
                        'Фишек:',
                        style: TextStyles.titleText20,
                      ),
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        value: _fcStore.sliderValue,
                        onChanged: (value) => _fcStore.changeSliderValue(value),
                      ),
                      const Text(
                        'Рублей: ',
                        style: TextStyles.titleText20,
                      ),
                      const SizedBox(height: 15)
                    ],
                  );
                }),
                firstButtonText: 'Отмена',
                secondButtonText: 'Подтвердить',
                title: 'Добавить операцию с фишками',
                secondButtonCallback: () {},
                firstButtonCallback: () => Navigator.pop(context),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
