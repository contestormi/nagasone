import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nagasone/data/models/chip_model.dart';
import 'package:nagasone/main.dart';
import 'package:nagasone/presentation/theme.dart';
import 'package:nagasone/stores/chip_store.dart';
import 'package:nagasone/widgets/custom_alert_dialog.dart';
import 'package:nagasone/widgets/transaction_widget.dart';

int calculateRubles(int chips) {
  if (chips < 10) {
    return 250 * chips;
  } else if (chips >= 10 && chips < 20) {
    return 220 * chips;
  } else if (chips >= 20 && chips < 30) {
    return 200 * chips;
  } else if (chips >= 30 && chips < 50) {
    return 185 * chips;
  } else if (chips >= 50 && chips < 100) {
    return 180 * chips;
  } else {
    return 160 * chips;
  }
}

class ChipsScreen extends StatefulWidget {
  const ChipsScreen({Key? key}) : super(key: key);

  @override
  State<ChipsScreen> createState() => _ChipsScreenState();
}

class _ChipsScreenState extends State<ChipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkBlue,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Observer(builder: (_) {
                return CustomAlertDialog(
                  content: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'НАЛ',
                            style: TextStyles.textBold14,
                          ),
                          Switch(
                            value: getIt<ChipStore>().isSwitched,
                            onChanged: (value) =>
                                getIt<ChipStore>().switcher(value),
                            activeTrackColor: AppColors.lightBlue,
                            activeColor: AppColors.darkBlue,
                            inactiveThumbColor: AppColors.darkBlue,
                            inactiveTrackColor: AppColors.lightBlue,
                          ),
                          const Text('БЕЗНАЛ', style: TextStyles.textBold14),
                        ],
                      ),
                      Text(
                        'Фишек: ${getIt<ChipStore>().sliderValue.toInt().toString()}',
                        style: TextStyles.titleText20,
                      ),
                      Slider(
                        inactiveColor: AppColors.lightBlue,
                        activeColor: AppColors.darkBlue,
                        divisions: 100,
                        min: 0.0,
                        max: 100.0,
                        value: getIt<ChipStore>().sliderValue,
                        onChanged: (value) =>
                            getIt<ChipStore>().changeSliderValue(value),
                      ),
                      Text(
                        'Рублей: ${calculateRubles(getIt<ChipStore>().sliderValue.toInt())}',
                        style: TextStyles.titleText20,
                      ),
                      const SizedBox(height: 15)
                    ],
                  ),
                  firstButtonText: 'Отмена',
                  secondButtonText: 'Подтвердить',
                  title: 'Добавить операцию с фишками',
                  secondButtonCallback: () async {
                    Navigator.pop(context);
                    await getIt<ChipStore>().createChipTransation();
                  },
                  firstButtonCallback: () => Navigator.pop(context),
                  showButtons: true,
                );
              });
            },
          ).then((val) {
            getIt<ChipStore>().clear();
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Observer(
        builder: (_) => getIt<ChipStore>().listOfChips.isEmpty
            ? FutureBuilder<List<ChipModel>>(
                future: getIt<ChipStore>().getChipsTransactions(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<ChipModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.darkBlue));
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (getIt<ChipStore>().listOfChips.isNotEmpty) {
                      return ListOfChips();
                    } else {
                      return const Center(
                          child: Text(
                        'Нет данных',
                        style: TextStyles.titleText14,
                      ));
                    }
                  } else {
                    return Center(
                        child: Text('State: ${snapshot.connectionState}'));
                  }
                },
              )
            : ListOfChips(),
      ),
    );
  }
}

class ListOfChips extends StatelessWidget {
  const ListOfChips({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: getIt<ChipStore>().listOfChips.length,
      itemBuilder: (context, index) {
        return TransactionWidget(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomAlertDialog(
                    content: Column(
                      children: [],
                    ),
                    firstButtonText: 'Удалить',
                    secondButtonText: 'Изменить',
                    title: 'Изменить или удалить FC транзакцию',
                    secondButtonCallback: () async {
                      Navigator.pop(context);
                      getIt<ChipStore>().setTempValues(
                          getIt<ChipStore>()
                                      .listOfChips[index]
                                      .transactionType ==
                                  'cash'
                              ? false
                              : true,
                          getIt<ChipStore>()
                              .listOfChips[index]
                              .chipCount
                              .toDouble());
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Observer(builder: (_) {
                            return CustomAlertDialog(
                              content: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'НАЛ',
                                        style: TextStyles.textBold14,
                                      ),
                                      Switch(
                                        value:
                                            getIt<ChipStore>().tempIsSwitched,
                                        onChanged: (value) => getIt<ChipStore>()
                                            .tempSwitcher(value),
                                        activeTrackColor: AppColors.lightBlue,
                                        activeColor: AppColors.darkBlue,
                                        inactiveThumbColor: AppColors.darkBlue,
                                        inactiveTrackColor: AppColors.lightBlue,
                                      ),
                                      const Text('БЕЗНАЛ',
                                          style: TextStyles.textBold14),
                                    ],
                                  ),
                                  Text(
                                    'Фишек: ${getIt<ChipStore>().tempSliderValue.toInt().toString()}',
                                    style: TextStyles.titleText20,
                                  ),
                                  Slider(
                                    inactiveColor: AppColors.lightBlue,
                                    activeColor: AppColors.darkBlue,
                                    divisions: 100,
                                    min: 0.0,
                                    max: 100.0,
                                    value: getIt<ChipStore>().tempSliderValue,
                                    onChanged: (value) => getIt<ChipStore>()
                                        .changeTempSliderValue(value),
                                  ),
                                  Text(
                                    'Рублей: ${calculateRubles(getIt<ChipStore>().tempSliderValue.toInt())}',
                                    style: TextStyles.titleText20,
                                  ),
                                  const SizedBox(height: 15)
                                ],
                              ),
                              firstButtonText: 'Отмена',
                              secondButtonText: 'Изменить',
                              title: 'Изменение FC транзакции',
                              secondButtonCallback: () async {
                                getIt<ChipStore>().changeChipTransation(
                                    getIt<ChipStore>().listOfChips[index].uuid,
                                    index);
                                Navigator.pop(context);
                              },
                              firstButtonCallback: () async {
                                Navigator.pop(context);
                              },
                              showButtons: true,
                            );
                          });
                        },
                      );
                    },
                    firstButtonCallback: () async {
                      Navigator.pop(context);
                      await getIt<ChipStore>().deleteTransaction(
                          getIt<ChipStore>().listOfChips[index].uuid, index);
                    },
                    showButtons: true,
                  );
                },
              );
            },
            uuid: getIt<ChipStore>().listOfChips[index].uuid,
            dateTime: getIt<ChipStore>().listOfChips[index].datetime,
            chipsAmount:
                getIt<ChipStore>().listOfChips[index].chipCount.toString(),
            transactionType:
                getIt<ChipStore>().listOfChips[index].transactionType,
            value: 'фишек');
      },
    );
  }
}
