import 'package:flutter/material.dart';
import 'package:inputs/forms/Input.dart';

class PasswordInput extends StatefulWidget {
  final Function(String) onChanged;
  final Function(String) validator;
  final String placeholder;
  final bool autofocus;

  const PasswordInput({
    Key key,
    this.placeholder,
    this.onChanged,
    this.validator,
    this.autofocus = false,
  }) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isSecret = true;

  @override
  Widget build(BuildContext context) {
    return Input(
      autofocus: widget.autofocus,
      obscureText: _isSecret,
      keyboardType: TextInputType.text,
      placeholder: widget.placeholder,
      onChanged: widget.onChanged,
      validator: widget.validator,
      suffixIcon: InkWell(
        onTap: () => setState(() => _isSecret = !_isSecret),
        child: Icon(!_isSecret ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
