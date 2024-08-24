import 'package:flutter/material.dart';

class EmptyDataSampleListWidget extends StatelessWidget {
  const EmptyDataSampleListWidget({
    super.key,
    this.color,
    this.onClickListener,
    this.message = ' ',
  });
  final String message;
  final Color? color;
  final void Function()? onClickListener;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClickListener != null) {
          onClickListener!();
        }
      },
      child: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
