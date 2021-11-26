import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController _controller;
  final String? labelText;
  final String? hintText;
  final IconData? icon;

  const Editor(this._controller,
      {Key? key, this.labelText, this.hintText, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText ?? '',
        hintText: hintText ?? '',
        icon: icon != null ? Icon(icon) : null,
      ),
      keyboardType: const TextInputType.numberWithOptions(),
      style: const TextStyle(
        fontSize: 20.0,
      ),
      controller: _controller,
    );
  }
}
