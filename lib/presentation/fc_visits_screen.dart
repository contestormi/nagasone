import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nagasone/data/models/visitor_model.dart';
import 'package:nagasone/main.dart';
import 'package:nagasone/presentation/theme.dart';
import 'package:nagasone/stores/main_store.dart';
import 'package:nagasone/widgets/custom_alert_dialog.dart';
import 'package:nagasone/widgets/labeled_checkbox.dart';

class FCVisitScreen extends StatefulWidget {
  const FCVisitScreen({Key? key}) : super(key: key);

  @override
  State<FCVisitScreen> createState() => _FCVisitScreenState();
}

class _FCVisitScreenState extends State<FCVisitScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: const Text(
          'Список гостей',
          style: TextStyles.titleText16,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkBlue,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog(
                content: ContentOfDialog(
                  textEditingController: _textEditingController,
                ),
                firstButtonText: 'Отмена',
                secondButtonText: 'Подтвердить',
                title: 'Добавить гостя',
                secondButtonCallback: () async {
                  Navigator.pop(context);
                  await getIt<MainStore>()
                      .createVisitor(_textEditingController.text);
                },
                firstButtonCallback: () => Navigator.pop(context),
                showButtons: true,
              );
            },
          ).then((val) {
            getIt<MainStore>().clear();
            _textEditingController.clear();
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Observer(builder: (context) {
        return Column(
          children: [
            getIt<MainStore>().listOfVisitors.isEmpty
                ? FutureBuilder<List<VisitorModel>>(
                    future: getIt<MainStore>().getVistirosList(),
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<List<VisitorModel>> snapshot,
                    ) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.darkBlue,
                          ),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        } else if (getIt<MainStore>()
                            .listOfVisitors
                            .isNotEmpty) {
                          return const Expanded(child: ListOfVisitors());
                        } else {
                          return const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text(
                                'Нет данных',
                                style: TextStyles.titleText14,
                              ),
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
                : const Expanded(child: ListOfVisitors()),
            const SizedBox(height: 10),
          ],
        );
      }),
    );
  }
}

class ListOfVisitors extends StatefulWidget {
  const ListOfVisitors({
    Key? key,
  }) : super(key: key);

  @override
  State<ListOfVisitors> createState() => _ListOfVisitorsState();
}

class _ListOfVisitorsState extends State<ListOfVisitors> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: getIt<MainStore>().listOfVisitors.length,
        itemBuilder: (context, index) {
          return LabeledCheckbox(
            label: getIt<MainStore>().listOfVisitors[index].fio,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: getIt<MainStore>().listOfVisitors[index].isPassed,
            callback: () {
              getIt<MainStore>().setSwitcher(index);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomAlertDialog(
                    content: Column(
                      children: const [],
                    ),
                    firstButtonText: 'Удалить',
                    secondButtonText: 'Изменить',
                    title: 'Изменить или удалить гостя',
                    firstButtonCallback: () async {
                      Navigator.pop(context);
                      getIt<MainStore>().deleteVisitor(index);
                    },
                    secondButtonCallback: () async {
                      textEditingController.text =
                          getIt<MainStore>().listOfVisitors[index].fio;
                      Navigator.pop(context);
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
                                        'Прошел',
                                        style: TextStyles.textBold14,
                                      ),
                                      Switch(
                                        value: getIt<MainStore>().isSwitched,
                                        onChanged: (value) =>
                                            getIt<MainStore>().switcher(value),
                                        activeTrackColor: AppColors.lightBlue,
                                        activeColor: AppColors.darkBlue,
                                        inactiveThumbColor: AppColors.darkBlue,
                                        inactiveTrackColor: AppColors.lightBlue,
                                      ),
                                      const Text(
                                        'Не прошел',
                                        style: TextStyles.textBold14,
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    controller: textEditingController,
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'ФИО',
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                              firstButtonText: 'Отмена',
                              secondButtonText: 'Изменить',
                              title: 'Изменить гостя',
                              firstButtonCallback: () => Navigator.pop(context),
                              showButtons: true,
                              secondButtonCallback: () async {
                                Navigator.pop(context);
                                getIt<MainStore>().changeVisitor(
                                  index,
                                  textEditingController.text,
                                );
                              },
                            );
                          });
                        },
                      ).then((val) {
                        textEditingController.clear();
                        getIt<MainStore>().clear();
                      });
                    },
                    showButtons: true,
                  );
                },
              );
            },
          );
        },
      );
    });
  }
}

class ContentOfDialog extends StatelessWidget {
  const ContentOfDialog({Key? key, required this.textEditingController})
      : super(key: key);

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          TextFormField(
            controller: textEditingController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Введите ФИО',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      );
    });
  }
}
