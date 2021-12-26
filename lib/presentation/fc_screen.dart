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
                            value: getIt<FCStore>().isSwitched,
                            onChanged: (value) =>
                                getIt<FCStore>().switcher(value),
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
                            width: 150,
                            child: ListTile(
                              horizontalTitleGap: 0,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: -4),
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
                            width: 130,
                            child: ListTile(
                              horizontalTitleGap: 0,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: -4),
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
                            width: 150,
                            child: ListTile(
                              horizontalTitleGap: 0,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: -4),
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
                            width: 130,
                            child: ListTile(
                              horizontalTitleGap: 0,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: -4),
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
                  ),
                  firstButtonText: 'Отмена',
                  secondButtonText: 'Подтвердить',
                  title: 'Добавить операцию с FC',
                  secondButtonCallback: () async {
                    Navigator.pop(context);
                    await getIt<FCStore>().createFCTransation();
                  },
                  firstButtonCallback: () => Navigator.pop(context),
                );
              });
            },
          ).then((val) {
            getIt<FCStore>().clear();
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Observer(
        builder: (_) => getIt<FCStore>().listOfFC.isEmpty
            ? FutureBuilder<List<FCModel>>(
                future: getIt<FCStore>().getFCTransactions(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<FCModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.darkBlue));
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (getIt<FCStore>().listOfFC.isNotEmpty) {
                      return ListView.builder(
                          itemCount: getIt<FCStore>().listOfFC.length,
                          itemBuilder: (context, index) {
                            return TransactionWidget(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Observer(builder: (_) {
                                        return CustomAlertDialog(
                                          content: Column(
                                            children: [],
                                          ),
                                          firstButtonText: 'Удалить',
                                          secondButtonText: 'Изменить',
                                          title:
                                              'Изменить или удалить FC транзакцию',
                                          secondButtonCallback: () async {
                                            Navigator.pop(context);
                                          },
                                          firstButtonCallback: () async {
                                            Navigator.pop(context);
                                            await getIt<FCStore>()
                                                .deleteTransaction(
                                                    getIt<FCStore>()
                                                        .listOfFC[index]
                                                        .uuid,
                                                    index);
                                          },
                                        );
                                      });
                                    },
                                  );
                                },
                                uuid: snapshot.data![index].uuid,
                                dateTime: snapshot.data![index].datetime,
                                chipsAmount:
                                    snapshot.data![index].amount.toString(),
                                transactionType:
                                    snapshot.data![index].transactionType,
                                value: 'рублей');
                          });
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
            : ListView.builder(
                itemCount: getIt<FCStore>().listOfFC.length,
                itemBuilder: (context, index) {
                  return TransactionWidget(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Observer(builder: (_) {
                              return CustomAlertDialog(
                                content: Column(
                                  children: [],
                                ),
                                firstButtonText: 'Удалить',
                                secondButtonText: 'Изменить',
                                title: 'Изменить или удалить FC транзакцию',
                                secondButtonCallback: () async {
                                  Navigator.pop(context);
                                },
                                firstButtonCallback: () async {
                                  Navigator.pop(context);
                                  await getIt<FCStore>().deleteTransaction(
                                      getIt<FCStore>().listOfFC[index].uuid,
                                      index);
                                },
                              );
                            });
                          },
                        );
                      },
                      uuid: getIt<FCStore>().listOfFC[index].uuid,
                      dateTime: getIt<FCStore>().listOfFC[index].datetime,
                      chipsAmount: getIt<FCStore>().listOfFC[index].amount == 0
                          ? 'free'
                          : getIt<FCStore>().listOfFC[index].amount.toString(),
                      transactionType:
                          getIt<FCStore>().listOfFC[index].transactionType,
                      value: getIt<FCStore>().listOfFC[index].amount == 0
                          ? ''
                          : 'рублей');
                },
              ),
      ),
    );
  }
}
