import 'package:flutter/material.dart';
import 'package:nagasone/presentation/theme.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.firstButtonText,
      required this.secondButtonText,
      required this.firstButtonCallback,
      required this.secondButtonCallback,
      required this.showButtons})
      : super(key: key);

  final String title;
  final String firstButtonText;
  final String secondButtonText;
  final Widget content;
  final VoidCallback firstButtonCallback;
  final VoidCallback secondButtonCallback;
  final bool showButtons;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 20,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: Text(
        title,
        style: TextStyles.titleText19,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          content,
          showButtons
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 42,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: firstButtonCallback,
                        child: Text(
                          firstButtonText,
                          style: TextStyles.text14Grey,
                        ),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(AppColors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(color: AppColors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 42,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: secondButtonCallback,
                        child: Text(secondButtonText,
                            style: TextStyles.text14White),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.darkBlue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
