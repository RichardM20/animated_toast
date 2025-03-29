import 'package:animated_toast/animated_toast.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Animated Toast Examples')),
        body: ToastExampleScreen(),
      ),
    );
  }
}

class ToastExampleScreen extends StatelessWidget {
  const ToastExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () => showAutocloseToast(context),
            child: Text('Show auto close Toast'),
          ),
          ElevatedButton(
            onPressed: () => showToastWithTwoCollors(context),
            child: Text('Show with two colors'),
          ),

          ElevatedButton(
            onPressed: () => showLeftToast(context),
            child: Text('Show from left'),
          ),

          ElevatedButton(
            onPressed: () => showToastWithSimpleAnimation(context),
            child: Text('showToastWithSimpleAnimation'),
          ),
        ],
      ),
    );
  }
}

void showToastWithSimpleAnimation(BuildContext context) {
  AnimatedToast.simpleAnimation(
    context: context,
    messageData: MessageData(
      title: 'Success!',
      subtitle: 'This is an auto close toast.',
    ),
    style: AnimatedToastStyle(
      leadingData: AnimatedToastLeadingData(withoutIcon: true),
    ),
    animationAlignment: AnimatedToastStartOf.left,
    duration: AnimatedToastDuration(
      begin: Duration(milliseconds: 450),
      displayDuration: Duration(seconds: 1),
    ),
  );
}

void showAutocloseToast(BuildContext context) {
  AnimatedToast.show(
    context: context,
    messageData: MessageData(
      title: 'Success!',
      subtitle: 'This is an auto close toast.',
    ),
    style: AnimatedToastStyle(
      boxDecoration: AnimatedToastBoxDecoration(color: Colors.white),
    ),
    duration: AnimatedToastDuration(
      begin: Duration(milliseconds: 600),
      displayDuration: Duration(seconds: 1),
    ),
  );
}

void showToastWithTwoCollors(BuildContext context) {
  AnimatedToast.show(
    context: context,
    messageData: MessageData(title: 'Sucess', subtitle: 'With two colors'),
    style: AnimatedToastStyle(
      boxDecoration: AnimatedToastBoxDecoration(
        initialBackgroundColor: Colors.blue,
        finalBackgroundColor: Colors.deepPurpleAccent,
      ),
    ),
    position: AnimatedToastPosition(top: false),
    animationAlignment: AnimatedToastStartOf.bottom,
  );
}

void showLeftToast(BuildContext context) {
  AnimatedToast.show(
    context: context,
    messageData: MessageData(
      title: 'Info',
      subtitle: 'This is an info subtitle.',
    ),
    position: AnimatedToastPosition(top: true),
    duration: AnimatedToastDuration(begin: Duration(milliseconds: 100)),
    animationAlignment: AnimatedToastStartOf.right,
    style: AnimatedToastStyle(
      boxDecoration: AnimatedToastBoxDecoration(color: Colors.white),
      leadingData: AnimatedToastLeadingData(withoutIcon: true),
    ),
  );
}
