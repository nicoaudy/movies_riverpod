import 'package:flutter/material.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    Key key,
    @required this.message,
    @required this.onPressed,
  })  : assert(message != null, 'A non-null String must be provided'),
        super(key: key);

  final String message;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(
            onPressed: onPressed,
            child: Text("Try again"),
          ),
        ],
      ),
    );
  }
}
