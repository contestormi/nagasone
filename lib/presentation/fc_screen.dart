import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nagasone/data/models/fc_model.dart';
import 'package:nagasone/main.dart';
import 'package:nagasone/presentation/theme.dart';
import 'package:nagasone/stores/fc_store.dart';
import 'package:nagasone/widgets/custom_alert_dialog.dart';
import 'package:nagasone/widgets/transaction_widget.dart';

class FCScreen extends StatelessWidget {
  const FCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkBlue,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog(
                content: ContentOfAlertDialog(),
                firstButtonText: 'Отмена',
                secondButtonText: 'Подтвердить',
                title: 'Добавить операцию с FC',
                secondButtonCallback: () async {
                  Navigator.pop(context);
                  await getIt<FCStore>().createFCTransation();
                },
                firstButtonCallback: () => Navigator.pop(context),
                showButtons: true,
              );
            },
          ).then((val) {
            getIt<FCStore>().clear();
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              await getIt<FCStore>().downloadReportFC();
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Отчет по FC',
                    style: TextStyles.titleText16DarkBlue,
                  ),
                  Column(
                    children: [
                      SizedBox(
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
              builder: (_) => getIt<FCStore>().listOfFC.isEmpty
                  ? FutureBuilder<List<FCModel>>(
                      future: getIt<FCStore>().getFCTransactions(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<FCModel>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.darkBlue));
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else if (getIt<FCStore>().listOfFC.isNotEmpty) {
                            return ListOFTransactions();
                          } else {
                            return const Center(
                                child: Text(
                              'Нет данных',
                              style: TextStyles.titleText14,
                            ));
                          }
                        } else {
                          return Center(
                              child:
                                  Text('State: ${snapshot.connectionState}'));
                        }
                      },
                    )
                  : ListOFTransactions(),
            ),
          ),
        ],
      ),
    );
  }
}

class ContentOfAlertDialog extends StatelessWidget {
  const ContentOfAlertDialog({
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
                value: getIt<FCStore>().isSwitched,
                onChanged: (value) => getIt<FCStore>().switcher(value),
                activeTrackColor: AppColors.lightBlue,
                activeColor: AppColors.darkBlue,
                inactiveThumbColor: AppColors.darkBlue,
                inactiveTrackColor: AppColors.lightBlue,
              ),
              const Text('БЕЗНАЛ', style: TextStyles.textBold14),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 112,
                child: ListTile(
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.symmetric(horizontal: -4),
                  title: Text("free"),
                  leading: Radio(
                    value: 1,
                    groupValue: getIt<FCStore>().val,
                    onChanged: (value) {
                      getIt<FCStore>().val = value as int;
                    },
                    activeColor: AppColors.darkBlue,
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                child: ListTile(
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.symmetric(horizontal: -4),
                  title: Text("400 руб."),
                  leading: Radio(
                    value: 2,
                    groupValue: getIt<FCStore>().val,
                    onChanged: (value) {
                      getIt<FCStore>().val = value as int;
                    },
                    activeColor: AppColors.darkBlue,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 112,
                child: ListTile(
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.symmetric(horizontal: -4),
                  title: Text("900 руб."),
                  leading: Radio(
                    value: 3,
                    groupValue: getIt<FCStore>().val,
                    onChanged: (value) {
                      getIt<FCStore>().val = value as int;
                    },
                    activeColor: AppColors.darkBlue,
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                child: ListTile(
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.symmetric(horizontal: -4),
                  title: Text("1500 руб."),
                  leading: Radio(
                    value: 4,
                    groupValue: getIt<FCStore>().val,
                    onChanged: (value) {
                      getIt<FCStore>().val = value as int;
                    },
                    activeColor: AppColors.darkBlue,
                  ),
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}

class ListOFTransactions extends StatelessWidget {
  const ListOFTransactions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ListView.builder(
        itemCount: getIt<FCStore>().listOfFC.length,
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
                        getIt<FCStore>().setTempValues(
                            getIt<FCStore>().listOfFC[index].transactionType ==
                                    'cash'
                                ? false
                                : true,
                            getIt<FCStore>().listOfFC[index].amount);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Observer(builder: (_) {
                              return CustomAlertDialog(
                                content: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'НАЛ',
                                          style: TextStyles.textBold14,
                                        ),
                                        Switch(
                                          value:
                                              getIt<FCStore>().tempIsSWitcher,
                                          onChanged: (value) => getIt<FCStore>()
                                              .tempSwitcher(value),
                                          activeTrackColor: AppColors.lightBlue,
                                          activeColor: AppColors.darkBlue,
                                          inactiveThumbColor:
                                              AppColors.darkBlue,
                                          inactiveTrackColor:
                                              AppColors.lightBlue,
                                        ),
                                        const Text('БЕЗНАЛ',
                                            style: TextStyles.textBold14),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 112,
                                          child: ListTile(
                                            horizontalTitleGap: 0,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: -4),
                                            title: Text("free"),
                                            leading: Radio(
                                              value: 1,
                                              groupValue:
                                                  getIt<FCStore>().tempVal,
                                              onChanged: (value) {
                                                getIt<FCStore>().tempVal =
                                                    value as int;
                                              },
                                              activeColor: AppColors.darkBlue,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 120,
                                          child: ListTile(
                                            horizontalTitleGap: 0,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: -4),
                                            title: Text("400 руб."),
                                            leading: Radio(
                                              value: 2,
                                              groupValue:
                                                  getIt<FCStore>().tempVal,
                                              onChanged: (value) {
                                                getIt<FCStore>().tempVal =
                                                    value as int;
                                              },
                                              activeColor: AppColors.darkBlue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 112,
                                          child: ListTile(
                                            horizontalTitleGap: 0,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: -4),
                                            title: Text("900 руб."),
                                            leading: Radio(
                                              value: 3,
                                              groupValue:
                                                  getIt<FCStore>().tempVal,
                                              onChanged: (value) {
                                                getIt<FCStore>().tempVal =
                                                    value as int;
                                              },
                                              activeColor: AppColors.darkBlue,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 120,
                                          child: ListTile(
                                            horizontalTitleGap: 0,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: -4),
                                            title: Text("1500 руб."),
                                            leading: Radio(
                                              value: 4,
                                              groupValue:
                                                  getIt<FCStore>().tempVal,
                                              onChanged: (value) {
                                                getIt<FCStore>().tempVal =
                                                    value as int;
                                              },
                                              activeColor: AppColors.darkBlue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                firstButtonText: 'Отмена',
                                secondButtonText: 'Изменить',
                                title: 'Изменение FC транзакции',
                                secondButtonCallback: () async {
                                  getIt<FCStore>().changeFCTransaction(index,
                                      getIt<FCStore>().listOfFC[index].uuid);
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
                        await getIt<FCStore>().deleteTransaction(
                            getIt<FCStore>().listOfFC[index].uuid, index);
                      },
                      showButtons: true,
                    );
                  },
                );
              },
              uuid: getIt<FCStore>().listOfFC[index].uuid,
              dateTime: getIt<FCStore>().listOfFC[index].datetime,
              chipsAmount: getIt<FCStore>().listOfFC[index].amount == 0
                  ? 'free'
                  : getIt<FCStore>().listOfFC[index].amount.toString(),
              transactionType: getIt<FCStore>().listOfFC[index].transactionType,
              value:
                  getIt<FCStore>().listOfFC[index].amount == 0 ? '' : 'рублей');
        },
      );
    });
  }
}
