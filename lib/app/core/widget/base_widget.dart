import 'package:base_flutter_bloc_pattem/app/core/utils/device_utils.dart';
import 'package:flutter/material.dart';

import 'loading_widget.dart';
import 'message_display.dart';

class BaseWidget extends StatelessWidget {
  final Widget bodyWidget;
  final bool loading;
  final String? errorMessage;

  const BaseWidget({
    Key? key,
    required this.bodyWidget,
    this.loading = false,
    this.errorMessage = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBody(bodyWidget, loading, errorMessage);
  }
}

class BaseWidgetBody extends StatefulWidget {
  final Widget child;
  final bool loading;
  final String? errorMessage;
  const BaseWidgetBody(this.child, this.loading, this.errorMessage, {Key? key})
      : super(key: key);

  @override
  _BaseStateWidgetBodyState createState() => _BaseStateWidgetBodyState();
}

class _BaseStateWidgetBodyState extends State<BaseWidgetBody> {
  @override
  Widget build(BuildContext context) {
    DeviceUtils.setContext(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            DeviceUtils.hideKeyboard(context);
          },
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                widget.child,

                //loading
                Visibility(
                  visible: widget.loading,
                  child: const BaseLoadingWidget(),
                ),

                //error
                Message.showToast(widget.errorMessage, context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
