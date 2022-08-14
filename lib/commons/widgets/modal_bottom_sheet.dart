import 'package:flutter/material.dart';
import 'package:movies_app/commons/constants/constants.dart';

class ModalBottomSheet {
  static showModalBottomSheetCustom({
    required BuildContext context,
    required Widget contentModal,
    Widget contentBottomModal = const SizedBox(),
    Color? backgroundColor,
    bool isDismissible = true,
    bool enableDrag = true,
    void Function()? onPressedClose,
  }) =>
      showModalBottomSheet<void>(
        context: context,
        backgroundColor: backgroundColor,
        isDismissible: isDismissible,
        isScrollControlled: true,
        barrierColor: Colors.transparent,
        enableDrag: enableDrag,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(35),
            topStart: Radius.circular(35),
          ),
        ),
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            padding: const EdgeInsetsDirectional.only(
              start: 20,
              end: 20,
              bottom: 30,
              top: 8,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () => onPressedClose != null
                        ? onPressedClose()
                        : Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Constants.thirdColor),
                  ),
                ),
                ...[
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [contentModal],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: contentBottomModal,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
}
