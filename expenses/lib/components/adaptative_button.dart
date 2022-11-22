import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButon extends StatelessWidget {
  // const AdaptativeButon({super.key});

  final String label;
  final Function() onPressed;

  AdaptativeButon(
    this.label,
    this.onPressed, {
      Key? key,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: onPressed,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
          )
        : ElevatedButton(
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).textTheme.button?.color,
              ),
            ),
            onPressed: onPressed,
        );
  }
}
