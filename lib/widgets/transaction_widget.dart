import 'package:flutter/material.dart';
import 'package:nagasone/presentation/theme.dart';
import 'package:nagasone/services/date_time_service.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    Key? key,
    required this.uuid,
    required this.transactionType,
    required this.dateTime,
    required this.chipsAmount,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  final String uuid;
  final String transactionType;
  final String dateTime;
  final String chipsAmount;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                        transactionType == 'cashless' ? 'БЕЗНАЛ' : 'НАЛ',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                chipsAmount.toString() + ' $value',
                style: TextStyles.titleText14,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Дата: ${DateTimeService.formatDate(dateTime)}',
                    style: TextStyles.titleText14,
                  ),
                  Text(
                    'Время: ${DateTimeService.formatTime(dateTime)}',
                    style: TextStyles.titleText14,
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
