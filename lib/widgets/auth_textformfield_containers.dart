import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldContainer extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String value)? onFieldSubmitted;
  final String? initialValue;
  final TextInputType? keyboardType;
  final String? text;
  final Widget? preffix;
  final bool? capitalizeFirstLetter;
  final bool allowSpaces;
  const TextFormFieldContainer({
    super.key,
    required this.controller,
    this.text,
    this.onFieldSubmitted,
    this.keyboardType,
    this.initialValue,
    this.preffix,
    this.validator,
    this.capitalizeFirstLetter,
    this.allowSpaces = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      initialValue: initialValue,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        label: text != null ? Text(text!) : null,
        prefixIcon: preffix,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}

class PasswordFormFieldContainer extends StatefulWidget {
  final TextEditingController controller;
  final Function(String value)? onFieldSubmitted;
  final String? Function(String? value)? validator;
  const PasswordFormFieldContainer({
    super.key,
    this.onFieldSubmitted,
    required this.controller,
    this.validator,
  });

  @override
  State<PasswordFormFieldContainer> createState() =>
      _PasswordFormFieldContainerState();
}

class _PasswordFormFieldContainerState
    extends State<PasswordFormFieldContainer> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      controller: widget.controller,
      obscureText: isObscure,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            isObscure
                ? Icons.visibility_off_outlined
                : Icons.remove_red_eye_outlined,
          ),
          onPressed: (() {
            setState(() {
              isObscure = !isObscure;
            });
          }),
        ),
        label: const Text("Password"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
