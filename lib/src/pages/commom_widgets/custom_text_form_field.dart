// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData icon;
  final String text;
  final TextEditingController? controller;
  final String label;
  final bool? obscureText;
  final EdgeInsetsGeometry padding;
  TextInputType? keyboardType;
  void Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  String? initialValue;
  bool readOnly;

  CustomTextFormField({
    Key? key,
    required this.icon,
    required this.text,
    this.controller,
    required this.label,
    this.padding = const EdgeInsets.all(15),
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.validator,
    this.initialValue,
    this.readOnly = false,
    this.obscureText = false,
    this.onSaved,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        obscureText: widget.obscureText!,
        initialValue: widget.initialValue,
        readOnly: widget.readOnly,
        onSaved: widget.onSaved,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          isDense: true,
          labelText: widget.label,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
