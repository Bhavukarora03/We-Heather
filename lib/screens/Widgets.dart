import 'package:flutter/material.dart';

class WillPopScopeTo extends StatelessWidget {
  final String titleText;
  final VoidCallback onPressedYes;
  final Widget child;
  final List<Widget> widgets;
  const WillPopScopeTo({Key key, this.titleText, this.onPressedYes, this.child, this.widgets,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Are you sure you want to quit?"),

              actions: [
                MaterialButton(
                    shape: RoundedRectangleBorder(),
                    onPressed: onPressedYes,
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    )),
                MaterialButton(
                    shape: RoundedRectangleBorder(),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ));
        return willLeave;
      },
      child: child,
    );
  }
}
