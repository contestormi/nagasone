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
                  content: const ChipBody(),
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
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              await getIt<ChipStore>().downloadReportChips();
            },
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Отчет по фишкам',
                    style: TextStyles.titleText16DarkBlue,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset('assets/download_icon.png', scale: 3),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) => getIt<ChipStore>().listOfChips.isEmpty
                  ? FutureBuilder<List<ChipModel>>(
                      future: getIt<ChipStore>().getChipsTransactions(),
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<List<ChipModel>> snapshot,
                      ) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.darkBlue,
                            ),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (getIt<ChipStore>()
                              .listOfChips
                              .isNotEmpty) {
                            return const ListOfChips();
                          } else {
                            return const Center(
                              child: Text(
                                'Нет данных',
                                style: TextStyles.titleText14,
                              ),
                            );
                          }
                        } else {
                          return Center(
                            child: Text('State: ${snapshot.connectionState}'),
                          );
                        }
                      },
                    )
                  : const ListOfChips(),
            ),
          ),
        ],
      ),
    );
  }
}

class ChipBody extends StatelessWidget {
  const ChipBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
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
                value: getIt<ChipStore>().isSwitched,
                onChanged: (value) => getIt<ChipStore>().switcher(value),
                activeTrackColor: AppColors.lightBlue,
                activeColor: AppColors.darkBlue,
                inactiveThumbColor: AppColors.darkBlue,
                inactiveTrackColor: AppColors.lightBlue,
              ),
              const Text('БЕЗНАЛ', style: TextStyles.textBold14),
            ],
          ),
          SizedBox(
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 56,
                  width: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      getIt<ChipStore>().changeChips(1);
                    },
                    child: const Text('1', style: TextStyles.text14White),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.darkBlue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 56,
                  width: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      getIt<ChipStore>().changeChips(5);
                    },
                    child: const Text('5', style: TextStyles.text14White),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.darkBlue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 56,
                  width: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      getIt<ChipStore>().changeChips(10);
                    },
                    child: const Text('10', style: TextStyles.text14White),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.darkBlue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 56,
                  width: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      getIt<ChipStore>().changeChips(15);
                    },
                    child: const Text('15', style: TextStyles.text14White),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.darkBlue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 56,
                  width: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      getIt<ChipStore>().changeChips(20);
                    },
                    child: const Text('20', style: TextStyles.text14White),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.darkBlue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 56,
                  width: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      getIt<ChipStore>().changeChips(30);
                    },
                    child: const Text('30', style: TextStyles.text14White),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.darkBlue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 56,
                  width: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      getIt<ChipStore>().changeChips(50);
                    },
                    child: const Text('50', style: TextStyles.text14White),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.darkBlue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 56,
                  width: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      getIt<ChipStore>().changeChips(75);
                    },
                    child: const Text('75', style: TextStyles.text14White),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.darkBlue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 56,
                  width: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      getIt<ChipStore>().changeChips(100);
                    },
                    child: const Text('100', style: TextStyles.text14White),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.darkBlue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 41,
                height: 41,
                child: FloatingActionButton(
                  onPressed: () {
                    getIt<ChipStore>().chipsDecrement();
                  },
                  child: const Icon(Icons.remove),
                  backgroundColor: AppColors.darkBlue,
                ),
              ),
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Text(
                      'Фишек: ${getIt<ChipStore>().chipsNumber}',
                      style: TextStyles.titleText16,
                    ),
                    Text(
                      'Рублей: ${calculateRubles(getIt<ChipStore>().chipsNumber)}',
                      style: TextStyles.titleText16,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 41,
                height: 41,
                child: FloatingActionButton(
                  onPressed: () {
                    getIt<ChipStore>().chipsIncrement();
                  },
                  child: const Icon(Icons.add),
                  backgroundColor: AppColors.darkBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      );
    });
  }
}

class ListOfChips extends StatelessWidget {
  const ListOfChips({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
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
                      children: const [],
                    ),
                    firstButtonText: 'Удалить',
                    secondButtonText: 'Изменить',
                    title: 'Изменить или удалить FC транзакцию',
                    secondButtonCallback: () async {
                      Navigator.pop(context);
                      getIt<ChipStore>().setTempValues(
                        getIt<ChipStore>().listOfChips[index].transactionType ==
                                'cash'
                            ? false
                            : true,
                        getIt<ChipStore>().listOfChips[index].chipCount,
                      );
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
                                      const Text(
                                        'БЕЗНАЛ',
                                        style: TextStyles.textBold14,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 180,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 56,
                                              width: 56,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  getIt<ChipStore>()
                                                      .changeTempChipsValue(
                                                    1,
                                                  );
                                                },
                                                child: const Text(
                                                  '1',
                                                  style: TextStyles.text14White,
                                                ),
                                                style: ButtonStyle(
                                                  elevation:
                                                      MaterialStateProperty.all<
                                                          double>(0),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(
                                                    AppColors.darkBlue,
                                                  ),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 56,
                                              width: 56,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  getIt<ChipStore>()
                                                      .changeTempChipsValue(
                                                    5,
                                                  );
                                                },
                                                child: const Text(
                                                  '5',
                                                  style: TextStyles.text14White,
                                                ),
                                                style: ButtonStyle(
                                                  elevation:
                                                      MaterialStateProperty.all<
                                                          double>(0),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(
                                                    AppColors.darkBlue,
                                                  ),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 56,
                                              width: 56,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  getIt<ChipStore>()
                                                      .changeTempChipsValue(
                                                    10,
                                                  );
                                                },
                                                child: const Text(
                                                  '10',
                                                  style: TextStyles.text14White,
                                                ),
                                                style: ButtonStyle(
                                                  elevation:
                                                      MaterialStateProperty.all<
                                                          double>(0),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(
                                                    AppColors.darkBlue,
                                                  ),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 180,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 56,
                                              width: 56,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  getIt<ChipStore>()
                                                      .changeTempChipsValue(
                                                    15,
                                                  );
                                                },
                                                child: const Text(
                                                  '15',
                                                  style: TextStyles.text14White,
                                                ),
                                                style: ButtonStyle(
                                                  elevation:
                                                      MaterialStateProperty.all<
                                                          double>(0),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(
                                                    AppColors.darkBlue,
                                                  ),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 56,
                                              width: 56,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  getIt<ChipStore>()
                                                      .changeTempChipsValue(
                                                    20,
                                                  );
                                                },
                                                child: const Text(
                                                  '20',
                                                  style: TextStyles.text14White,
                                                ),
                                                style: ButtonStyle(
                                                  elevation:
                                                      MaterialStateProperty.all<
                                                          double>(0),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(
                                                    AppColors.darkBlue,
                                                  ),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 56,
                                              width: 56,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  getIt<ChipStore>()
                                                      .changeTempChipsValue(
                                                    30,
                                                  );
                                                },
                                                child: const Text(
                                                  '30',
                                                  style: TextStyles.text14White,
                                                ),
                                                style: ButtonStyle(
                                                  elevation:
                                                      MaterialStateProperty.all<
                                                          double>(0),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(
                                                    AppColors.darkBlue,
                                                  ),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 180,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 56,
                                              width: 56,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  getIt<ChipStore>()
                                                      .changeTempChipsValue(
                                                    50,
                                                  );
                                                },
                                                child: const Text(
                                                  '50',
                                                  style: TextStyles.text14White,
                                                ),
                                                style: ButtonStyle(
                                                  elevation:
                                                      MaterialStateProperty.all<
                                                          double>(0),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(
                                                    AppColors.darkBlue,
                                                  ),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 56,
                                              width: 56,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  getIt<ChipStore>()
                                                      .changeTempChipsValue(
                                                    75,
                                                  );
                                                },
                                                child: const Text(
                                                  '75',
                                                  style: TextStyles.text14White,
                                                ),
                                                style: ButtonStyle(
                                                  elevation:
                                                      MaterialStateProperty.all<
                                                          double>(0),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(
                                                    AppColors.darkBlue,
                                                  ),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 56,
                                              width: 56,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  getIt<ChipStore>()
                                                      .changeTempChipsValue(
                                                    100,
                                                  );
                                                },
                                                child: const Text(
                                                  '100',
                                                  style: TextStyles.text14White,
                                                ),
                                                style: ButtonStyle(
                                                  elevation:
                                                      MaterialStateProperty.all<
                                                          double>(0),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(
                                                    AppColors.darkBlue,
                                                  ),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            height: 41,
                                            width: 41,
                                            child: FloatingActionButton(
                                              onPressed: () {
                                                getIt<ChipStore>()
                                                    .chipsTempDecrement();
                                              },
                                              child: const Icon(Icons.remove),
                                              backgroundColor:
                                                  AppColors.darkBlue,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 150,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Фишек: ${getIt<ChipStore>().tempChipsNumber}',
                                                  style: TextStyles.titleText16,
                                                ),
                                                Text(
                                                  'Рублей: ${calculateRubles(getIt<ChipStore>().tempChipsNumber)}',
                                                  style: TextStyles.titleText16,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 41,
                                            width: 41,
                                            child: FloatingActionButton(
                                              onPressed: () {
                                                getIt<ChipStore>()
                                                    .chipsTempIncrement();
                                              },
                                              child: const Icon(Icons.add),
                                              backgroundColor:
                                                  AppColors.darkBlue,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                ],
                              ),
                              firstButtonText: 'Отмена',
                              secondButtonText: 'Изменить',
                              title: 'Изменение FC транзакции',
                              secondButtonCallback: () async {
                                getIt<ChipStore>().changeChipTransation(
                                  getIt<ChipStore>().listOfChips[index].uuid,
                                  index,
                                );
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
                        getIt<ChipStore>().listOfChips[index].uuid,
                        index,
                      );
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
            value: 'фишек',
          );
        },
      );
    });
  }
}
