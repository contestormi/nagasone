import 'package:flutter/material.dart';
import 'package:nagasone/presentation/theme.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    Key? key,
    required this.uuid,
    required this.transactionType,
    required this.dateTime,
    required this.price,
  }) : super(key: key);

  final String uuid;
  final String transactionType;
  final String dateTime;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                uuid,
                style: TextStyles.textBold12,
              ),
              Container(
                width: 75,
                decoration: const BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                      child: Text(
                          transactionType == 'cashless' ? 'БЕЗНАЛ' : 'НАЛ')),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              price.toString(),
              style: TextStyles.titleText14,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              DateTime.parse(dateTime).month.toString(),
              style: TextStyles.titleText14,
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
